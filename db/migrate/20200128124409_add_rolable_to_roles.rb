class AddRolableToRoles < ActiveRecord::Migration[5.2]
  def change
  	add_reference :roles, :rolable, polymorphic: true, index: true
  end
end
