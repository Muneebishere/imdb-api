class RenameRoleToShowCelebrityShowRole < ActiveRecord::Migration[5.2]
  def change
  	rename_table :roles, :celebrity_show_roles
  end
end
