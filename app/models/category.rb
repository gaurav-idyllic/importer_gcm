# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  name_map   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :companies, dependent: :destroy, join_table: :company_categories
  has_many :company_categories

  validates_presence_of :name

  before_save :update_name_map


  private

  def update_name_map
    self.name_map = self.name.to_s.parameterize unless self.name_map.present?
  end
end
