namespace :onetime do
  desc "bundle exec rake onetime:add_oprations"
  task :add_oprations => :environment do
    begin
      ActiveRecord::Base.transaction do
        ['delivery', 'manufacturing', 'assembling', 'packing'].each do |name|
          Operation.create!(name: name)
        end
        p 'task completed successfully !!!'
      end
    rescue Exception => ex
      Rails.logger.debug("Exception in add_oprations: Message: #{ex.message}/n/n/n/n Backtrace: #{ex.backtrace}")
    end
  end
end
