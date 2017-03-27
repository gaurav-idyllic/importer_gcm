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

class Operation < ActiveRecord::Base
  has_many :companies, dependent: :destroy

  validates_presence_of :name

  before_save :update_name_map

  private

  def update_name_map
    name_map = name.to_s.parameterize unless name_map.present?
  end
end
