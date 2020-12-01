class Chatroom < ApplicationRecord
  belongs_to :house
  has_many :messages
  has_many :users, through: :messages
end
