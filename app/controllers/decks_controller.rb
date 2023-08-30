class DecksController < ApplicationController
  def index
    @decks = Deck.where(level: params[:level])
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def levels
  end
end
