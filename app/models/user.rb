class User < ActiveRecord::Base
  include Average

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memeberships, dependent: :destroy
  has_many :beer_clubs, through: :memeberships
  has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15}
  validates :password, length: {minimum: 3}
  validates_format_of :password, with: /[A-Z]/
  validates_format_of :password, with: /[0-9]/

  def to_s
    return self.username
  end
  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end
end
