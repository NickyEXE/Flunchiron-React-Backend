class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :kind_of_food
  # I created a file called serializer.rb in my initializers and added this block of code, which does the camelcasing for us:
  # ActiveModelSerializers.config.key_transform = :camel_lower

end
