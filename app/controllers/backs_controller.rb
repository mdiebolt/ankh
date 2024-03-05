class BacksController < ApplicationController
  before_action :set_deck

  def show
    @card = @deck.cards.find(params[:id])
    @review_confidence = {
      again: 1.minute,
      hard:  6.minutes,
      good:  10.minutes,
      easy:  3.days
    }
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end
end
