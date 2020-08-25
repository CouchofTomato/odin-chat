class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..20 }
  has_many :room_messages
end
