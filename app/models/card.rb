class Card < ApplicationRecord
  belongs_to :deck

  has_rich_text :front
  has_rich_text :back

  scope :reviewable, -> { where("review_at < ?", Time.current).order(:review_at) }

  attribute :review_at, :datetime, default: -> { Time.current }
end
