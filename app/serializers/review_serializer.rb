class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :heading, :body, :created_at, :rating, :user
end
