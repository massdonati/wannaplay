#constrain not more than game.alloud_players players
class PlayersController < ApplicationController

  def create

    @game = Game.find(params[:game_id])
    @player = @game.players.create(params[:player])

    respond_to do |format|
      if @player.save
        format.html {redirect_to @game, notice: "#{@player.name} was succesfully added to this Game"}
        format.json {render json: @player, status: :created, location: @player}    
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
end