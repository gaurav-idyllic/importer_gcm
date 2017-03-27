class UploadService < BaseService
  attr_reader :upload
  HEADERS = %W(company invoice_num invoice_date operation_date amount reporter notes status kind)

  def initialize(upload)
    @upload = upload
  end

  def process_file
    require 'csv'
    path = Rails.root.to_s + '/public' + upload.attachment_url
    csv_headers, total_records = CSV.open(path, 'r') { |csv| [csv.first, csv.count] }
    upload.update_attributes(total_records: total_records)

    unless (csv_headers == HEADERS)
      upload.update_attributes(failure_msg: 'Headers mis match in csv file. Please upload correct file.')
      return
    end
    operations = Operation.all
    SmarterCSV.process(path, { chunk_size: 1000 }) do |chunk|
      raw_sql = []
      chunk.each do |datum|
        begin
          ActiveRecord::Base.transaction do
            upload.increment!(:processed_records)
            categories = datum.delete(:kind)
            comp_data = datum.to_hash
            comp_data = comp_data.each { |k, v| comp_data[k] = v.to_s.squish.downcase }
            comp_data[:operation_id] = operations.sample.id
            company = Company.create!(comp_data)
            categories.to_s.squish.downcase.split(';').each do |cat|
              category = Category.find_or_create_by!(name: cat)
              raw_sql << "(#{company.id}, #{category.id}, '#{Time.now}', '#{Time.now}')"
            end
          end
        rescue
          upload.increment!(:failed_records)
        end
      end
      if raw_sql.present?
        sql = "INSERT INTO company_categories(company_id, category_id, created_at, updated_at) VALUES #{raw_sql.join(', ')}"
        ActiveRecord::Base.connection.execute sql
      end
    end
  end

end

# CSV.foreach(path, headers: true).each_slice(1000) do |data|
#   statement = ''
#   data.each do |datum|
#     begin
#       categories = datum['kind']
#       comp_data = datum.to_hash.except('kind')
#       comp_data = comp_data.each { |k, v| comp_data[k] = v.to_s.squish.downcase }
#       company = Company.create!(comp_data)
#       categories.to_s.split(';').each do |cat|
#         category = Category.find_or_create_by!(name: cat.squish.downcase)
#         company.company_categories.create!(category: category)
#       end
#     rescue
#       upload.update_attributes(failed_records: upload.failed_records + 1)
#     end
#   end
# end
