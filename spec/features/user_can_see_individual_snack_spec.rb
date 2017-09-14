require 'rails_helper'

feature "User can visit a snack page" do
	scenario "and can see snack info and locations" do
		owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snk = dons.snacks.create(name: "Cheetos", price: 2.5)
    tur = snk.machines.create(location: "Turing Basement", owner_id: owner.id)
		galv = snk.machines.create(location: "Beer Tap", owner_id: owner.id)
		du = snk.machines.create(location: "DU", owner_id: owner.id)
		dons.snacks.create(name: "Whiskey", price: 5.7)
		dons.snacks.create(name: "Peanuts", price: 1.46)
		tur.snacks.create(name: "Water", price: 0.0)
		galv.snacks.create(name: "Beer", price: 0.0)
		du.snacks.create(name: "Coca Cola", price: 1.66)
		du.snacks.create(name: "Pepsi", price: 1.60)
		du.snacks.create(name: "Mad Dog", price: 1.44)

		visit snack_path(snk)

		expect(page).to have_content("Cheetos")

		expect(page).to have_content("Price: $2.50")

		expect(page).to have_content(dons.location)
		expect(page).to have_content(tur.location)
		expect(page).to have_content(galv.location)
		expect(page).to have_content(du.location)

		expect(page).to have_content(tur.average_price)
		expect(page).to have_content(dons.average_price)
		expect(page).to have_content(galv.average_price)
		expect(page).to have_content(du.average_price)

		expect(page).to have_content("2")
		expect(page).to have_content("3")
		expect(page).to have_content("2")
		expect(page).to have_content("4")
	end
end