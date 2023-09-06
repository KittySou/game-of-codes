class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :completed]

  def index
    @decks = Deck.where(level: params[:level])
    @completed_decks = current_user.decks.where(level: params[:level])
    @last_completed_deck_index = @decks.find_index(@completed_decks.last)
    @next_playable_deck_index = @last_completed_deck_index ? @last_completed_deck_index + 1 : 0
  end

  def completed
    @user_deck = UserDeck.new(user: current_user, deck: @deck)
    @user_deck.save
    head :no_content
  end

  def show
    @multiplayer = params[:racetrack].present?
    if @multiplayer
      @racetrack = Racetrack.find(params[:racetrack])
      @opponent = @racetrack.player_1 == current_user ? @racetrack.player_2 : @racetrack.player_1
    end
  end

  def levels
  end

  def questions
    @deck = Deck.includes(questions: :answers).find(params[:id])
    respond_to :json
  end

  def menu
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
