class BacksController < ApplicationController
  before_action :set_deck

  def show
    @card = @deck.cards.find(params[:id])
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end
end
