class Celebrity < ApplicationRecord
	has_many :celebrity_show_roles, dependent: :destroy
	has_many :films, through: :celebrity_show_roles, source: :rolable, source_type: :Film
	has_one_attached :display_picture
	
	validates :full_name, :biography, :birth_date, presence: true

	def name
    full_name
  end
end