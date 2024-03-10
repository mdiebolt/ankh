module CardHelper
  def again_rating
    rating_for(Recall::Again)
  end

  def hard_rating
    rating_for(Recall::Hard)
  end

  def good_rating
    rating_for(Recall::Good)
  end

  def easy_rating
    rating_for(Recall::Easy)
  end

  private

  def rating_for(recall_class)
    recall_class.new(Card.new).rating
  end
end
