class Recall::Good < Recall
  def rating = 3

  def stage=(val)
    @stage = STAGES[:review]
    @stage = STAGES[:learning] if val == STAGES[:new]
  end

  def new!
    initialize_difficulty
    initialize_stability

    @review_at += 10.minutes
  end

  def learn!(_)
    interval = interval_for(@stability)
    schedule(interval)
  end

  def review!(hard_stability, _good_stability)
    hard_interval = interval_for(hard_stability)
    good_interval = interval_for(@stability)
    hard_interval = [ hard_interval, good_interval ].min

    schedule([ good_interval, hard_interval + 1 ].max)
  end

  private

  def schedule(interval)
    @scheduled_days = interval
    @review_at += interval.days
  end
end
