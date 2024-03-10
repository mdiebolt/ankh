class Deck < ApplicationRecord
  has_many :cards

  scope :up_for_review, -> {
    joins(:cards)
      .where(cards: { review_at: ..Time.current })
      .distinct
  }
end
