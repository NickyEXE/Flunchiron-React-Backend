class RestaurantShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :lat, :long, :address, :image_url, :kind_of_food
  has_many :reviews
end
