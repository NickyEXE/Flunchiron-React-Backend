class ReviewsController < ApplicationController
  before_action :set_current_user

  def create
    review = @current_user.reviews.create(review_params)
    render json: review
  end

  private

  def review_params
    params.permit(:restaurant_id, :content, :rating)
  end

end
