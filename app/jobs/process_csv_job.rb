class ProcessCsvJob < ActiveJob::Base
  queue_as :default

  after_perform do |job|
    upload_id = job.arguments.first
    upload = Upload.find_by(id: upload_id)
    upload.completed!
  end

  def perform(upload_id)
    upload = Upload.find_by(id: upload_id)
    if(upload)
      upload_service = UploadService.new(upload)
      upload_service.process_file
    end
  end
end
