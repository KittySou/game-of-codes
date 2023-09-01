class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    @decks = Deck.where(level: params[:level])
  end

  def show
  end

  def levels
  end

  def questions
    @deck = Deck.includes(questions: :answers).find(params[:id])
    respond_to :json
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
