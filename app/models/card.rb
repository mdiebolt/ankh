class Card < ApplicationRecord
  belongs_to :deck

  has_rich_text :front
  has_rich_text :back
end
