class RenameColumnReviewToBodyInReview < ActiveRecord::Migration[5.2]
  def change
  	rename_column :reviews, :review, :body
  end
end
