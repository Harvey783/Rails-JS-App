class User < ApplicationRecord
  has_many :projects
  has_many :activities, through: :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
