# app/controllers/reviews_controller.rb

class ReviewsController < ApplicationController

  def index
    @reviews = @restaurant.reviews
  end

  def show
  end

  def new
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to restaurant_review_path(@restaurant, @review), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurant_reviews_path(@restaurant), notice: 'Review was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = @restaurant.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
