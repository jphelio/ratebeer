
module Average
  def average_rating
    avg=0
    self.ratings.each do |rating|
      avg+=rating.score
    end
    return avg/self.ratings.count
  end
end


class Beer < ActiveRecord::Base
  include Average

  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end
end


