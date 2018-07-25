class ProjectSerializer < ActiveModel::Serializer
  attributes :name, :id
  has_many :activities
  belongs_to :user
end
