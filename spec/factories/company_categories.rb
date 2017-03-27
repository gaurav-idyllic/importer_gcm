# == Schema Information
#
# Table name: company_categories
#
#  id          :integer          not null, primary key
#  company_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :company_category do
    
  end
end
