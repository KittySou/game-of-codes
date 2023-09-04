class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    @decks = Deck.where(level: params[:level])
    @completed_decks = current_user.decks.where(level: params[:level])
    @last_completed_deck_index = @decks.find_index(@completed_decks.last)
    @next_playable_deck_index = @last_completed_deck_index ? @last_completed_deck_index + 1 : 0
  end

  def show
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
