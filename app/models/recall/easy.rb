class Recall::Easy < Recall
  def rating = 4

  def stage=(val)
    @stage = STAGES[:review]
  end

  def new!
    initialize_difficulty
    initialize_stability

    interval = interval_for(@stability)
    @scheduled_days = interval
    @review_at += interval.days
  end

  def learn!(good_stability)
    good_interval = interval_for(good_stability)
    easy_interval = interval_for(@stability)

    schedule([ easy_interval, good_interval + 1 ].max)
  end

  def review!(hard_stability, good_stability)
    hard_interval = interval_for(hard_stability)
    good_interval = interval_for(good_stability)

    hard_interval = [ hard_interval, good_interval ].min
    good_interval = [ good_interval, hard_interval + 1 ].max

    easy_interval = [ interval_for(@stability), good_interval + 1 ].max

    schedule(easy_interval)
  end

  private

  def schedule(interval)
    @scheduled_days = interval
    @review_at += interval.days
  end

  def recall_stability(difficulty, stability, retrievability)
    super * parameters[16]
  end
end
