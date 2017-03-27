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

FactoryGirl.define do
  factory :company do
    name "MyString"
    invoice_number "MyString"
    invoice_date "MyString"
    amount "9.99"
    reporter "MyString"
    notes "MyText"
  end
end
