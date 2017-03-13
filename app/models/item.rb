class Item < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	has_many :carts, through: :line_items

	def self.available_items
		where("inventory > ?", 0)
		# all.select{|item| item.inventory > 0}
	end
end
