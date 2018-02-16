require 'rails_helper'

describe "As a user" do
  context "when I visit a specific vending machine page" do
    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      owner = Owner.create!(name: "bob")
      machine = Machine.create!(location: "Place", owner: owner)
      snack = Snack.create!(name: "cheeto", price: 100, machine_id: machine.id)
      snack = Snack.create!(name: "freca", price: 10, machine_id: machine.id)
      snack = Snack.create!(name: "mac n cheese", price: 100, machine_id: machine.id)
      snack = Snack.create!(name: "bagel", price: 900, machine_id: machine.id)

      visit machine_path(machine)

      expect(page).to have_content('cheeto')
      expect(page).to have_content('freca')
      expect(page).to have_content('mac n cheese')
      expect(page).to have_content('bagel')
    end
  end
end
