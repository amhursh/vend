require 'rails_helper'

RSpec.describe Machine, type: :model do
	describe ".average_price" do
		it "returns formatted average price of snacks" do
			owner = Owner.create(name: "Sam")
			machine = owner.machines.create(location: "Turing")
			machine.snacks.create(name: "Cheetos", price: 3.50)
			machine.snacks.create(name: "Doritos", price: 2.56)
			machine.snacks.create(name: "Cocacola", price: 1.99)

			expect(machine.average_price).to eq "$2.68"
		end
	end

	describe ".inventory" do
		it "returns a count of snacks for a machine" do
			owner = Owner.create(name: "Sam")
			machine = owner.machines.create(location: "Turing")
			machine.snacks.create(name: "Cheetos", price: 3.50)
			machine.snacks.create(name: "Doritos", price: 2.56)
			machine.snacks.create(name: "Cocacola", price: 1.99)

			expect(machine.inventory).to eq 3
		end
	end
end