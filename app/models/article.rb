class Article < ApplicationRecord
	has_rich_text :content
	belongs_to :admin
	has_many :has_categories
	has_many :categories, through: :has_categories

	# Permite agregar una propiedad
	attr_accessor :category_elements
	
	def save_categories
		return has_categories.destroy_all if category_elements.nil? || category_elements.empty?
		has_categories.where.not(category_id: category_elements).destroy_all
		# categories_array = category_elements.split(',') Con CheckBox se lo convirtio en array
		category_elements.each do |category_id|
			HasCategory.find_or_create_by(article: self, category_id: category_id)	
			#unless HasCategory.where(article: self, category_id: category_id).any?
				# otra opcion HasCategory.create(article: self, category_id: category_id)	(mas cara)
			#end			
		end	
	end
end
