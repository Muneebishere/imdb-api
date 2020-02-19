class AddBioColumnsInCelebrities < ActiveRecord::Migration[5.2]
  def change
  	add_column :celebrities, :birth_name, :string
  	add_column :celebrities, :height, :float
  	add_column :celebrities, :horsescope, :integer
  end
end
