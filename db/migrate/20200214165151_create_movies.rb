class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year_created
      t.string :genre
    end
  end
end
