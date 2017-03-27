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

class CompanyCategory < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
end
