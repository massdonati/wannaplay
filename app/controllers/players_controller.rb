#constrain not more than game.alloud_players players
class PlayersController < ApplicationController

  def create

    @game = Game.find(params[:game_id])
    @players = @game.players.create(params[:player])

    if @player.save
      format.html {redirect_to @game, notice: "#{@player.name} was succesfully added to this Game"}
      format.json {render json: @player, status: :created}    
    else
      format.html { render action: "new" }
      format.json { render json: @player.errors, status: :unprocessable_entity }
    end
  end
end