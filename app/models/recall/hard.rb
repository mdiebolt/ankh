class Recall::Hard < Recall
  def rating = 2

  def stage=(val)
    @stage =
      case val
      when STAGES[:new]                           then STAGES[:learning]
      when STAGES[:learning], STAGES[:relearning] then val
      when STAGES[:review]                        then STAGES[:review]
      end
  end

  def new!
    initialize_difficulty
    initialize_stability

    @review_at += 5.minutes
  end

  def learn!(_)
    schedule(0)
  end

  def review!(_hard_stability, good_stability)
    hard_interval = interval_for(@stability)
    good_interval = interval_for(good_stability)

    schedule([ hard_interval, good_interval ].min)
  end

  private

  def schedule(interval)
    @scheduled_days = interval

    if interval.positive?
      @review_at += interval.days
    else
      @review_at += 10.minutes
    end
  end

  def recall_stability(difficulty, stability, retrievability)
    super * parameters[15]
  end
end
