class ReviewsController < ApplicationController
    before_action :require_login
    
    def index
        @game = Game.find_by_id(params[:game_id])  
        @reviews = @game.reviews
        # # @user = User.find_by_id(params[:user_id) 
        # @game_reviews = Review.game_reviews(params[:game_id])
        # byebug
    end

    def new
    
        @game = Game.find_by_id(params[:game_id])
        @review = Review.new
    end 

    def create
        @game = Game.find_by_id(params[:game_id])
        @review = Review.new(review_params)
        @review.user = current_user
            if  @review.valid?
                @review.save
                redirect_to game_reviews_path(@review.game)
            else 
                render :new
            end
    end

    private

    def review_params
        params.require(:review).permit(:content, :game_id)
    end
end
