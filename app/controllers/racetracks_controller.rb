class RacetracksController < ApplicationController
  before_action :set_deck, except: [:update, :history]
  # skip_before_action :verify_authenticity_token, only: [:progress]

  def new
    @racetrack = Racetrack.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @racetrack = Racetrack.new(racetrack_params)
    @racetrack.player_1 = current_user
    @racetrack.deck = @deck
    if @racetrack.save
      redirect_to deck_path(@deck, racetrack: @racetrack.id)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @racetrack = Racetrack.find(params[:id])
    return head :forbidden if @racetrack.completed

    @winner = User.find(params[:winning_player_id])
    @racetrack.completed = true
    @racetrack.winner = @winner
    @racetrack.save
    head :no_content
  end

  def history
    @racetracks = Racetrack.where("(player_1_id = ? or player_2_id = ?) and completed = ?", current_user, current_user, true)
    # raise
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def racetrack_params
    params.require(:racetrack).permit(:player_2_id)
  end
end
