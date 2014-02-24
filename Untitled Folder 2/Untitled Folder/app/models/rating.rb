class Rating < ActiveRecord::Base
  belongs_to :Beer
  belongs_to :User

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  def to_s
    beer = Beer.where(id: self.beer_id).first
    return "#{beer.name} #{self.score}"
  end

  def getUser
    return User.where(id: self.user_id).first
  end

end
