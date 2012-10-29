#constrain not more than game.alloud_players players
class PlayersController < ApplicationController

  def create

    @game = Game.find(params[:game_id])
    if @game.players.find params[:player]
      
      respond_with do |format|
        format.html { redirect_to @game, :notice => "Player already exists" }
      #  format.json { render json: @player.errors, status: :not_acceptable }
      end
    else

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