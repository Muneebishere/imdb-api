class ShowDetail < ApplicationRecord
  belongs_to :detailable, polymorphic: true

	has_one_attached :poster
  has_many_attached :images

  validates :poster, :budget, :duration, :title, :release_date, :plot, presence: true
  validates :plot, length: {
	  maximum: 500
	}
end