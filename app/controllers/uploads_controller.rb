class UploadsController < ApplicationController

  def index
    @uploads = Upload.all.order(created_at: :desc)
  end

  def new
    @upload = Upload.new
  end

  def create
    attachment = params[:upload][:attachment]
    original_filename = attachment.original_filename
    upload = Upload.create(attachment: attachment, original_file_name: original_filename, file_name: original_filename + '**' + DateTime.now.to_s)
    ProcessCsvJob.perform_later(upload.id)
    redirect_to uploads_path
  end
end
