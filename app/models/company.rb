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

class Company < ActiveRecord::Base
  paginates_per 250

  has_and_belongs_to_many :categories, dependent: :destroy, join_table: :company_categories
  has_many :company_categories
  belongs_to :operation

  validates_presence_of :company, :invoice_num, :invoice_date, :operation_date, :amount, :reporter, :notes, :status, :operation_id
end
