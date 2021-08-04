class GamesController < ApplicationController
    before_action :require_login
   

    def index
        @games = Game.all.ordered_by_title
    end
    
    def new
        @game = Game.new
        @game.build_category
    end

    def show
     
        @game = Game.find_by_id(params[:id])
       
        if !@game
            redirect_to games_path
            #if game can not be found 
        end
    end

    def edit
            @game = Game.find_by_id(params[:id])
            if @game
                @game.build_category
            else
                redirect_to games_path
             #if game can not be found 
            end
            
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

    def update
        @game = Game.find_by_id(params[:id])
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

    def destroy
        @game = Game.find_by_id(params[:id])
        Game.delete(@game.id) 
        redirect_to games_path
    end


    private

    def game_params
        params.require(:game).permit(:title, :image, :description, :category_id, :category_attributes => [:name])
    end


    
end
