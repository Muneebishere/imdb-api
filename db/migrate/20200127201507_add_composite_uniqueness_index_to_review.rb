class AddCompositeUniquenessIndexToReview < ActiveRecord::Migration[5.2]
  def change
  	add_index :reviews, [:film_id, :user_id], unique: true
  end
end
