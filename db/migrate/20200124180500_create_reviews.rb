class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :film
      t.float :rating
      t.text :review

      t.timestamps
    end
  end
end
