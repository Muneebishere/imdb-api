class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.references :film
      t.references :celebrity
      t.integer :type
      t.string :character_name

      t.timestamps
    end
  end
end
