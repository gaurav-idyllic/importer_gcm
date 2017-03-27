# == Schema Information
#
# Table name: uploads
#
#  id                 :integer          not null, primary key
#  attachment         :string
#  file_name          :string
#  original_file_name :string
#  total_records      :integer          default("0")
#  processed_records  :integer          default("0")
#  failed_records     :integer          default("0")
#  status             :integer          default("0")
#  failure_msg        :text             default("")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Upload < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  DATE_FORMAT = '%d-%m-%Y %H:%M:%S'

  enum status: {
    in_progress: 0,
    completed: 1
  }
end
