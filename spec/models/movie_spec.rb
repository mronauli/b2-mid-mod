require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :year_created}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe "average_age" do
  it "can count average age of actors in movie" do
    movie_1 = Movie.create(name: "Big Dogs", year_created: 1997, genre: "comedy", studio: studio_1)
    actor_1 = Actor.create(name: "Billy Bob", age: 40, movies:[movie_1])
    actor_2 = Actor.create(name: "Queen Latifah", age: 60, movies:[movie_1])
    expect(movie_1.average_age).to eq(50)
    end
  end
end
