class Project < ApplicationRecord
  has_many :activities, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
