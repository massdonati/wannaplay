#constrain not more than game.alloud_players players
class PlayersController < ApplicationController
  respond_to :html

  def create
    @game = Game.find(params[:game_id])
    @player = @game.players.create(params[:player])
    respond_to do |format|
      if @player.save
        format.html {redirect_to @game, :notice => "#{params[:player][:name]} was succesfully added to this Game"}
        #   format.json {render json: @player, status: :created, location: @player}
      else
        format.html { render @game }
        #  format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

    
  def destroy

    @player = Player.find(params[:player][:id])
    @game = Game.find(params[:game][:id])
    @game.players.delete(@player)

    respond_to do |format|
      format.html 
      format.json { head :no_content }
    end
    
  end

end