class GamesController < ApplicationController
  respond_to :html
  def index
    @games = Game.all
    respond_with @games
  end

  def create

    @game = Game.new(params[:game])

    if @game.save
      respond_with @game
    else
      respond_with @game.errors
    end
    
  end

  def new
    @game = Game.new
    
  end

  def show

    @game = Game.find(params[:id])
    respond_with @game
    
  end



end