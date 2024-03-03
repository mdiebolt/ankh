class ReviewsController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @card = @deck.cards.reviewable.first
  end
end
