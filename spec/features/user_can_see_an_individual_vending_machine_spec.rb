require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Cheetos", price: 2.5)
    dons.snacks.create(name: "Moonpie", price: 3.99)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Cheetos: $2.50")
    expect(page).to have_content("Moonpie: $3.99")
    expect(page).to have_content ("Average Price: $3.25")
  end
end
