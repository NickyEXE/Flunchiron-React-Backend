class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    # render json: {restaurants: Restaurant.all.map{|r| RestaurantSerializer.new(r)}, kindsOfFood: Restaurant.kinds_of_food}
    render json: {restaurants: ActiveModelSerializers::SerializableResource.new(Restaurant.all, each_serializer: RestaurantSerializer), kindsOfFood: Restaurant.kinds_of_food}
  end

  def show
    render json: @restaurant, serializer: RestaurantShowSerializer
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by_id(params[:id])
  end

end
