class Activity < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
end
