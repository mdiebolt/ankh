class Recall::Again < Recall
  def rating = 1

  def stage=(val)
    @stage =
      case val
      when STAGES[:new]                           then STAGES[:learning]
      when STAGES[:learning], STAGES[:relearning] then val
      when STAGES[:review]                        then STAGES[:relearning]
      end
  end

  def new!
    initialize_difficulty
    initialize_stability

    @review_at += 1.minute
  end

  def learn!(_)
    schedule(5)
  end

  def review!(_hard_stability, _good_stability)
    schedule(5)
  end

  private

  def schedule(interval)
    @scheduled_days = 0
    @review_at += interval.minutes
  end

  def recall_stability(difficulty, stability, retrievability)
    parameters[11] *
      (difficulty ** -parameters[12]) *
      ((stability + 1) ** parameters[13] - 1) *
      Math.exp((1 - retrievability) * parameters[14])
  end
end
