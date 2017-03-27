# == Schema Information
#
# Table name: operations
#
#  id         :integer          not null, primary key
#  name       :string
#  name_map   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :operation do
    name "MyString"
    name_map "MyString"
  end
end
