class BeerClub < ActiveRecord::Base
  has_many :memeberships
  has_many :users, through: :memeberships

  def to_s
    return self.name
  end

end
