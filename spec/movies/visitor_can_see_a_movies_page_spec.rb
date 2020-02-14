require 'rails_helper'

RSpec.describe 'on an actors show page' do
    describe "as a visitor" do
      it "can see all the studios a list of all the movies from each studio" do
        studio_1 = Studio.create(name: "Cinemark")
        studio_2 = Studio.create(name: "Warner Bros")
        movie_1 = Movie.create(name: "Big Dogs", year_created: 1997, genre: "comedy", studio: studio_1)
        movie_2 = Movie.create(name: "Scary Movie", year_created: 2000, genre: "horror", studio: studio_2)
        movie_3 = Movie.create(name: "Funny Movie", year_created: 2000, genre: "comedy", studio: studio_2)
        actor_1 = Actor.create(name: "Billy Bob", age: 40, movies:[movie_1, movie_2])
        actor_2 = Actor.create(name: "Queen Latifah", age: 50, movies:[movie_3])
        actor_3 = Actor.create(name: "Seth Rogan", age: 60, movies:[movie_1])


        visit "/movies/#{movie_1.id}"

        expect(page).to have_content(movie_1.name)
        expect(page).to have_content(movie_1.year_created)
        expect(page).to have_content(movie_1.genre)
        expect(page).to have_content(actor_1.name)
        expect(page).to have_content(actor_2.name)
        expect(page).to have_content("50")
      end
    end
  end
# Story 3
# As a user,
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
