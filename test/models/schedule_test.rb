require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  test "#for" do
    Recall.instance_variable_set(:@parameters, parameters)
    recall = Recall.new(Card.new)
    recall.review_at = DateTime.new(2022, 11, 29, 12, 30, 0, 0)

    repeat_schedule = ratings.map do |rating|
      recall = Schedule.new(recall).for(rating)
      recall.scheduled_days
    end

    assert_equal [ 0, 5, 16, 43, 106, 236, 0, 0, 12, 25, 47, 85, 147 ], repeat_schedule
  end

  private

  def parameters
    [ 1.14, 1.01, 5.44, 14.67, 5.3024, 1.5662, 1.2503, 0.0028, 1.5489, 0.1763, 0.9953, 2.7473, 0.0179, 0.3105, 0.3976, 0.0, 2.0902 ]
  end

  def ratings
    [
      3, 3, 3, 3, 3, 3,
      1, 1,
      3, 3, 3, 3, 3
    ]
  end
end
