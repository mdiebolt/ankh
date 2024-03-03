class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      redirect_to @deck
    else
      @deck = Deck.new
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
