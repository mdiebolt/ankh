class CardsController < ApplicationController
  before_action :set_deck

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.deck = @deck
    @card.review_at = Time.current

    if @card.save
      redirect_to deck_path(@deck)
    else
      @card = Card.new
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @card = @deck.cards.find(params[:id])
  end

  def update
    @card = @deck.cards.find(params[:id])

    if @card.update(review_at: Time.current + params.dig(:card, :review_in))
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
