class PlayersController < ApplicationController
    def index
        @team = Team.find(params[:team_id])
        @players = @team.players
        render :index

    end

    def show
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])
        render :show
    end 

    def new
        @team = Team.find(params[:team_id])
        @player = Player.new
        render :new
    end

    def edit
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])
        render :edit

    end

    def create
        @team = Team.find(params[:team_id])
        @player = @team.players.build(params.require(:player).permit(:first_name, :last_name, :position))
        if @player.save
            flash[:success] = "player created successfully"
            redirect_to team_players_url(@team)
        else
            flash.now[:error] = "player created failed"
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])
        if @player.update(params.require(:player).permit(:first_name, :last_name, :position))
            flash[:success] = "player updated successfully"
            redirect_to team_player_url(@team, @player)
        else
            flash.now[:error] = "player udpate failed"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])
        @player.destroy
        flash[:success] = "player deleted successfully"
        redirect_to team_players_url(@team), status: :see_other
    end


end
