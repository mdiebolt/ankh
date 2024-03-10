class ReviewsController < ApplicationController
  def index
    @decks = Deck.up_for_review
  end

  def show
    @deck = Deck.find(params[:id])
    @card = @deck.cards.reviewable.first
  end
end
