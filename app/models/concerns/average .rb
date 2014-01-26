module Average
  extend ActiveSupport::Concern
  def average_rating
    avg=0
    self.ratings.each do |rating|
      avg+=rating.score
    end
    return avg/self.ratings.count
  end
end