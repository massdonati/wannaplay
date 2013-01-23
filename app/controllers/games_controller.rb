class GamesController < ApplicationController
  respond_to :html
  def index
    @games = Game.all
    respond_with @games
  end


  def new
    @game = Game.new

  end

  def create
    @game = Game.new(params[:game])

      if @game.save
         redirect_to @game, notice: 'Game was successfully created.'
        
      else
         render action: "new"
        
      end
    
  end

  def edit

    @game = Game.find(params[:id])
    
  end

  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, :notice => 'Game was successfully updated.'}
        format.json { head :no_content }
        
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show

    @game = Game.find(params[:id])
    respond_with @game
    
  end

  def destroy

    if params[:player]
      @game = Game.find(params[:id])
      @player = Player.find(params[:player])
      @game.players.delete(@player)

      respond_to do |format|
        format.html { redirect_to @game, :notice => "#{@player.name} was successfully deleted." }
      end
    else
    
      @game = Game.find(params[:id])
      @game.destroy

      respond_to do |format|
        format.html { redirect_to games_url }
        format.json { head :no_content }
      end
    end
  end
end