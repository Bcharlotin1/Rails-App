class ReviewsController < ApplicationController
    before_action :require_login
    before_action :set_game_reviews_variable, except:[:create]
    before_action :set_review_variable, except: [:index, :new, :create]
   
    
    def index
        @reviews = @game.reviews
    end

    def new
        @review = Review.new
    end 

    def create
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
        must_be_current_user
    end

    def update
        if @review.valid?
            @review.update(review_params)
            redirect_to game_reviews_path(@game)
        else
            render :edit 
        end
    end

    def destroy
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
    end

    def set_game_reviews_variable
        @game = Game.find(id: params[:game_id])
    end

    def set_review_variable
        @review = Review.find_by_id(params[:id])
    end
end
