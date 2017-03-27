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

require 'rails_helper'

RSpec.describe CompanyCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
