class ReviewsController < ApplicationController
  def index
    @decks = Deck.up_for_review
  end

  def show
    @deck = Deck.find(params[:id])
    @card = @deck.cards.reviewable.first
    @review_confidence = {
      again: 1.minute,
      hard:  6.minutes,
      good:  10.minutes,
      easy:  3.days
    }
  end
end
