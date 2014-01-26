class Rating < ActiveRecord::Base
  belongs_to :Beer

  def to_s
    beer = Beer.where(id: self.beer_id).first
    return "#{beer.name} #{self.score}"
  end

end
