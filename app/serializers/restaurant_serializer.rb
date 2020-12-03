class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :imageUrl

  def imageUrl
    object.image_url
  end

end
