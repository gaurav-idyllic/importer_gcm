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

FactoryGirl.define do
  factory :upload do
    file_name "MyString"
    original_file_name "MyString"
    total_records 1
    processed_records 1
    failed_records 1
  end
end
