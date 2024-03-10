class Schedule
  def initialize(card)
    @card = card
    @card.elapse!

    @again = Recall::Again.new(card)
    @hard  = Recall::Hard.new(card)
    @good  = Recall::Good.new(card)
    @easy  = Recall::Easy.new(card)

    @recall_levels = [ @again, @hard, @good, @easy ]

    recall_levels.each { _1.stage = card.stage }
  end

  def for(rating)
    recall!

    recall_levels.each_with_object({}) do |level, hash|
      hash[level.rating] = level
    end[rating]
  end

  private

  attr_reader :recall_levels

  def recall!
    if @card.new?
      recall_levels.each(&:new!)
    elsif @card.learning? || @card.relearning?
      recall_levels.each { _1.learn!(@good.stability) }
    elsif @card.review?
      difficulty = @card.difficulty
      stability = @card.stability

      recall_levels.each do |recall|
        recall.difficulty = difficulty
        recall.update_stability(difficulty, stability, @card.retrievability)

        recall.review!(@hard.stability, @good.stability)
      end
    end
  end
end
