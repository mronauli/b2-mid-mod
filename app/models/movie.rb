class Movie < ApplicationRecord
  validates_presence_of :name, :year_created, :genre
  belongs_to :studio
  has_many :actors
  has_many :actor_movies
  has_many :actor, through: :actor_movies
end
