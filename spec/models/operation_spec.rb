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

require 'rails_helper'

RSpec.describe Operation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end