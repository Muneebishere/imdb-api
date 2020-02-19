class CreateFilmGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :film_genres do |t|
      t.references :film, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
