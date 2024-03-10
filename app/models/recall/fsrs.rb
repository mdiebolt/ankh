# FSRS: Free Spaced Repetition Scheduler, an open source algorithm for spaced repetition.
# It’s implemented in Anki and considered an improvement over the SM-2 algorithm.
#
# This Ruby implementation is adapted from a Python implementation found here.
# https://github.com/open-spaced-repetition/py-fsrs/blob/main/src/fsrs/fsrs.py
#
# There isn’t much test coverage to feel confident that this is 100% correct,
# so it may be worth investigating the Rust implementation which powers the
# main Anki app.
module Recall::FSRS
  DEFAULT_PARAMETERS = [ 0.4, 0.6, 2.4, 5.8, 4.93, 0.94, 0.86, 0.01, 1.49, 0.14, 0.94, 2.18, 0.05, 0.34, 1.26, 0.29, 2.61 ]

  def self.included(_)
    Recall.instance_variable_set(:@parameters, DEFAULT_PARAMETERS)
  end

  DECAY = -0.5
  RETENTION = 0.9
  MAXIMUM_INTERVAL = 36_500

  FACTOR = RETENTION ** (1 / DECAY) - 1

  def retrievability_across(interval, stability)
    (1 + FACTOR * interval / stability) ** DECAY
  end

  def interval_for(stability)
    interval = stability / FACTOR * (RETENTION ** (1 / DECAY) - 1)
    interval.round.clamp(1, MAXIMUM_INTERVAL)
  end

  def initial_difficulty
    difficulty = parameters[4] - parameters[5] * (rating - 3)
    difficulty.clamp(1, 10)
  end

  def calculate_difficulty(current)
    mean_reversion(
      parameters[4],
      current - parameters[6] * (rating - 3)
    ).clamp(1, 10)
  end

  def initial_stability
    [ parameters[rating - 1], 0.1 ].max
  end

  def mean_reversion(initial, current)
    parameters[7] * initial + (1 - parameters[7]) * current
  end

  private

  def parameters
    Recall.instance_variable_get(:@parameters)
  end
end
