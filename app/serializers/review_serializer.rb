class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :username
  # has_one :user
  # has_one :restaurant

  def username
    object.user.username
  end

end
