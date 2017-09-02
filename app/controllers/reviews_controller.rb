class ReviewsController < ApplicationController

  def create
    # raise "Yay, I'm here!"

      @review = Review.new(review_params)
      @review.product_id = params[:product_id]
      @review.user = current_user
      @review.save

      if @review.save
        flash[:success] = "Woot"
        redirect_to '/'
      else
        redirect_to '/login'
      end

  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
