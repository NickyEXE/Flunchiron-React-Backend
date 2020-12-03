class RestaurantShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :lat, :long, :address, :imageUrl, :kindOfFood

  def imageUrl
    object.image_url
  end

  def kindOfFood
    object.kind_of_food
  end

end
