class CardsController < ApplicationController
  before_action :set_deck

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.deck = @deck

    if @card.save
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @card = @deck.cards.find(params[:id])

    if @card.review_based_on(params.dig(:card, :rating).to_i)
      redirect_to review_path(@deck)
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
