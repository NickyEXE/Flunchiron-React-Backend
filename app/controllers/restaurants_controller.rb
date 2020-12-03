class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    render json: Restaurant.all
  end

  def show
    render json: @restaurant, serializer: RestaurantShowSerializer
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by_id(params[:id])
  end

end
