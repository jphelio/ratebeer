class BeerClub < ActiveRecord::Base
  has_many :memeberships
  has_many :members, through: :memeberships, source: :user

  def to_s
    return self.name
  end

end
