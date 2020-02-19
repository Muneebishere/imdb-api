class SetDefultValueForOverallRatingInDetail < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :details, :overall_rating, 0.0
  end
end
