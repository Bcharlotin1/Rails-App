class GamesController < ApplicationController
    before_action :require_login
   

    def index
        @games = Game.all.ordered_by_title
    end
    
    def show
        @game = Game.find_by_id(params[:id])
        if !@game
            redirect_to games_path
        end
    end


    def search
            @games_search = Game.search_game(params[:search])
    end

    private

    def game_params
        params.require(:game).permit(:title, :image, :description, :category_id, :category_attributes => [:name])
    end


    
end
