class Brewery < ActiveRecord::Base

  def future_year
    if year >Date.today.year
      errors.add(:year, "Wrong year")
    end
  end
  include Average

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, uniqueness: true, length: { minimum: 1 }
  validate :future_year

  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    less_than_or_equal_to:2014,
                                    only_integer: true }

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def to_s
    return name
  end
end
