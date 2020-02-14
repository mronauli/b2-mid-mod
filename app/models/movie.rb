class Movie < ApplicationRecord
  validates_presence_of :name, :year_created, :genre
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def average_age
    Actor.average(:age).present? ? Actor.average(:age) : 0
  end

  def order_age
    Actor.select(:name).order(age: :desc)
  end
end
