
class Beer < ActiveRecord::Base
  include Average

  validates :name, uniqueness: true, length: { minimum: 1 }
  validates :style, length: { minimum: 1 }

  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end
end


