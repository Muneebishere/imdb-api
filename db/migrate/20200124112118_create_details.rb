class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :detailable, polymorphic: true
      t.integer :budget
      t.integer :duration
      t.string :title
      t.integer :content_rating
      t.float :overall_rating
      t.string :genre
      t.date :release_date
      t.text :plot

      t.timestamps
    end
  end
end
