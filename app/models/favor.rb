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
class Favor < ApplicationRecord
  include AASM
  belongs_to :user, dependent: :destroy

  enum category: [:health, :education, :emergency, :services, :other]

  aasm do
    state :inactive, initial: true
    state :active, :success, :failed

    event :activate do
      transitions from: :inactive, to: :active
    end

    event :fulfilled do
      transitions from: :active, to: :success
    end

    event :failed do
      transitions from: :active, to: :failed
    end
  end

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
