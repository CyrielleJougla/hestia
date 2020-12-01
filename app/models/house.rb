class House < ApplicationRecord
  belongs_to :user
  has_many :habitants
  has_many :tasks, dependent: :destroy
  has_many :gifts, dependent: :destroy
  has_one :chatroom
end
