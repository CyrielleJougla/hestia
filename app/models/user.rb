class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_one :house, dependent: :destroy
  has_one :habitant, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :tasks, dependent: :destroy

end
