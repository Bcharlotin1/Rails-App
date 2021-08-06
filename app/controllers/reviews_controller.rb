class ReviewsController < ApplicationController
    before_action :require_login
    
    def index
        @game = Game.find_by_id(params[:game_id])  
        @reviews = @game.reviews
        
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

    def edit
        @game = Game.find_by_id(params[:game_id])
        @review = Review.find_by_id(params[:id])
        must_be_current_user
        # if  !@review.user = current_user
        #         return head(:forbidden) 
        # end
    end

    def update
        @game = Game.find_by_id(params[:game_id])
        @review = Review.find_by_id(params[:id])
        if @review.valid?
            @review.update(review_params)
            redirect_to game_reviews_path(@game)
        else
            render :edit 
        end
    end

    def destroy
        @game = Game.find_by_id(params[:game_id])
        @review = Review.find_by_id(params[:id])
        must_be_current_user
        @review.destroy
        redirect_to game_reviews_path(@game)
      end

    private

    def review_params
        params.require(:review).permit(:content, :game_id)
    end

    def must_be_current_user
       if  @review.user != current_user
        redirect_to game_reviews_path(@game)
       end
        #makes it un hackble in the ispect 
    end
end
