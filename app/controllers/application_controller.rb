class ApplicationController < ActionController::Base

	before_action :categories, :brands, :cart_count

	def categories
		@categories = Category.order(:name)
	end

	def brands
		@brands = Product.pluck(:brand).sort.uniq
	end
	def cart_count
		@cart_count = LineItem.all.length
	end
end
