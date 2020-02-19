class CreateCelebrities < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrities do |t|
      t.string :full_name
      t.date :birth_date
      t.text :biography

      t.timestamps
    end
  end
end
