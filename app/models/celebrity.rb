class Celebrity < ApplicationRecord
	has_many :celebrity_show_roles, dependent: :destroy
	has_many :films, through: :celebrity_show_roles, source: :rolable, source_type: :Film
	has_one_attached :display_picture
	
	validates :full_name, :biography, :birth_date, presence: true

	def self.search_records(query)
		search_text = '%%'
		if query.present?
			query = query.strip
			query = query.downcase
			search_text = '%' + (query.present? ? query.downcase : '') + '%'
		end
		Celebrity.where("lower(full_name) LIKE ?", search_text)
	end

	def occupations
		self.celebrity_show_roles.pluck(:role_type).uniq
	end

	def name
    full_name
  end
end