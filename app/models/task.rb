class Task < ApplicationRecord
  belongs_to :house
  belongs_to :user, optional: true
  validates :points, numericality: { greater_than_or_equal_to: 1 }
end
