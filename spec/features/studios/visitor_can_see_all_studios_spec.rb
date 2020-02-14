require 'rails_helper'

RSpec.describe 'on a studio index page' do
    describe "as a visitor" do
      it "can see all the studios a list of all the movies from each studio" do
        studio_1 = Studio.create(name: "Cinemark")
        studio_2 = Studio.create(name: "Warner Bros")
        movie_1 = Movie.create(name: "Big Dogs", year_created: 1997, genre: "comedy", studio: studio_1)
        movie_2 = Movie.create(name: "Scary Movie", year_created: 2000, genre: "horror", studio: studio_2)
        movie_3 = Movie.create(name: "Funny Movie", year_created: 2000, genre: "comedy", studio: studio_2)

        visit "/studios"
        within("#studio-#{studio_1.id}") do
          expect(page).to have_content(studio_1.name)
          expect(page).to have_content(movie_1.name)
        end
        within("#studio-#{studio_2.id}") do
          expect(page).to have_content(studio_2.name)
          expect(page).to have_content(movie_2.name)
          expect(page).to have_content(movie_3.name)
        end
      end
    end
  end
