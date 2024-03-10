class Card < ApplicationRecord
  belongs_to :deck, touch: true

  has_rich_text :front
  has_rich_text :back

  scope :reviewable, -> {
    where(review_at: ..Time.current).order(:review_at)
  }

  attribute :review_at,   :datetime, default: -> { Time.current }
  attribute :reviewed_at, :datetime, default: -> { Time.current }

  def review_based_on(rating)
    data = schedule.for(rating)

    update \
      review_at:      data.review_at,
      reviewed_at:    data.reviewed_at,
      elapsed_days:   data.elapsed_days,
      scheduled_days: data.scheduled_days,
      stability:      data.stability,
      difficulty:     data.difficulty,
      stage:          data.stage
  end

  def to_s
    attributes.inject("") do |output, (k, v)|
      output << "#{k}: #{v}\n"
    end
  end

  private

  def schedule
    recall = Recall.new(self)
    Schedule.new(recall)
  end
end
