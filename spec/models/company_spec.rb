# == Schema Information
#
# Table name: companies
#
#  id             :integer          not null, primary key
#  company        :string
#  invoice_num    :string
#  invoice_date   :date
#  operation_date :date
#  amount         :decimal(, )
#  reporter       :string
#  notes          :text
#  status         :string
#  operation_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
