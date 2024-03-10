class Recall
  include FSRS

  attr_accessor :review_at
  attr_reader :reviewed_at
  attr_reader :elapsed_days, :scheduled_days, :stability, :difficulty
  attr_reader :stage

  def initialize(card)
    @review_at      = card.review_at

    @reviewed_at    = card.reviewed_at

    @elapsed_days   = card.elapsed_days
    @scheduled_days = card.scheduled_days
    @stability      = card.stability
    @difficulty     = card.difficulty

    @stage          = card.stage
  end

  def elapse!
    if new?
      @elapsed_days = 0
    else
      @elapsed_days = (@review_at - @reviewed_at).to_i
    end

    @reviewed_at = @review_at
  end

  def initialize_difficulty
    @difficulty = initial_difficulty
  end

  def initialize_stability
    @stability = initial_stability
  end

  def difficulty=(val)
    @difficulty = calculate_difficulty(val)
  end

  def update_stability(...)
    @stability = recall_stability(...)
  end

  def retrievability
    retrievability_across(@elapsed_days, @stability)
  end

  STAGES = {
    new:        "new",
    learning:   "learning",
    review:     "review",
    relearning: "relearning"
  }

  def new?        = @stage == STAGES[:new]
  def learning?   = @stage == STAGES[:learning]
  def review?     = @stage == STAGES[:review]
  def relearning? = @stage == STAGES[:relearning]

  private

  # This is the base recall stability. `Recall::Good` uses it directly.
  # `Recall::Easy` and `Recall::Hard` modify this with a multiplier
  # and `Recall::Again` uses a completely different calculation.
  def recall_stability(difficulty, stability, retrievability)
    stability *
      (1 + Math.exp(parameters[8]) *
      (11 - difficulty) *
      (stability ** -parameters[9]) *
      (Math.exp((1 - retrievability) * parameters[10]) - 1))
  end
end
