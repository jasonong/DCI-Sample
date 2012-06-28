require 'spec_helper'

feature "Creating Auction", js: true do
  background do
    User.create(name: "Sam the Seller")
  end

  scenario "Successfully creating an auction" do
    visit new_auction_path

    fill_in "Item name", with: "Stamps"
    fill_in "Item description", with: "Collection of stamps"
    fill_in "Buy it now price", with: "200"
    click_button "Create"

    page.should have_content("Auction was successfully created.")
  end

  scenario "Showing errors when cannot create an auction" do
    visit new_auction_path

    fill_in "Item name", with: ""
    fill_in "Item description", with: "Collection of stamps"
    fill_in "Buy it now price", with: "200"
    click_button "Create"

    page.should have_content("Name can't be blank")
  end
end