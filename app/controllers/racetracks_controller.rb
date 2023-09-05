class RacetracksController < ApplicationController
  before_action :set_deck, only: [:new, :create]

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

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def racetrack_params
    params.require(:racetrack).permit(:player_2_id)
  end
end
