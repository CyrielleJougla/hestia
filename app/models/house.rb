class House < ApplicationRecord
  belongs_to :user
  has_many :habitants
  has_many :tasks, dependent: :destroy
  has_one :gift, dependent: :destroy
  has_one :chatroom
  validates :name, uniqueness: true
end
