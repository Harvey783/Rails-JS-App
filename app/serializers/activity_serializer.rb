class ActivitySerializer < ActiveModel::Serializer
  attributes :name, :id
  belongs_to :project
end
