class ReviewsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
    def index
      reviews = Review.all
    end

    def show
        review = Review.find(params[:id])
    end

    def create
        review = Review.new(review_params)
    end

    def destroy;end

    private

     def review_params
      params.require(:review).permit(:title, :name, :content, :rating)
    end
end