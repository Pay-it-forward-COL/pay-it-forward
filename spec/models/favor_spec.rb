# == Schema Information
#
# Table name: favors
#
#  id          :bigint           not null, primary key
#  aasm_state  :string
#  category    :integer
#  description :text
#  latitude    :float
#  longitude   :float
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_favors_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Favor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
