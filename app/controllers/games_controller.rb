class GamesController < ApplicationController
    before_action :require_login
    before_action :set_game_variable, except: [:index, :create, :new, :search]

    def index
        @games = Game.all.ordered_by_title
    end

    def show
        if !@game
            redirect_to games_path
        end
    end

    def new
        @game = Game.new
        @game.build_category
    end

    def create
        @game = Game.new(game_params)
            if  @game.valid?
                @game.save
                redirect_to game_path(@game)
            else 
                render :new
            end
    end

    def edit
        if @game
            @game.build_category
        else
            redirect_to games_path
        end
    end

    def update
        if @game.valid?
		    @game.update(game_params)
            redirect_to game_path(@game)
        else
            render :edit
        end
    end

    def search
            @games_search = Game.search_game(params[:search])
    end



    private

    def game_params
        params.require(:game).permit(:title, :image, :description, :category_id, :category_attributes => [:name])
    end

    def set_game_variable
        @game = Game.find_by_id(params[:id])
    end

    
end
