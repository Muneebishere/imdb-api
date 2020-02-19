class CelebrityShowRole < ApplicationRecord
	enum role_type: [:director, :writer, :producer, :cast, :crew]
		
	belongs_to :celebrity
	belongs_to :rolable, polymorphic: true

	validates :rolable, :celebrity, presence: true

  rails_admin do
    configure :rolable do
    end
  end
end
