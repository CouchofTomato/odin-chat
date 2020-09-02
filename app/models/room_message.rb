class RoomMessage < ApplicationRecord
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :message, presence: true

  belongs_to :room
  belongs_to :user
end
