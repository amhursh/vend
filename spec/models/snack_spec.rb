require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe ".price_converted" do
		it "returns formatted price of snack" do
			snack = Snack.create(name: "Cocacola", price: 2.68)
			snack2 = Snack.create(name: "Pepsi", price: 1.5)
			snack3 = Snack.create(name: "Bitcoin", price: 0.94093849384024)

			expect(snack.price_converted).to eq "$2.68"
			expect(snack2.price_converted).to eq "$1.50"
			expect(snack3.price_converted).to eq "$0.94"
		end
	end
end
