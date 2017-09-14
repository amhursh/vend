class Snack < ApplicationRecord
	has_many :machine_snacks
	has_many :machines, through: :machine_snacks

	def price_converted
		"$" + sprintf('%.2f', price)
	end
end
