class AddHeadingColumnInReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :heading, :string
  end
end
