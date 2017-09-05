require 'rails_helper'

# RSpec.feature "AddToCarts", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add an item to the cart" do
    # ACT
    visit root_path

    click_on 'Add'

    # click_link 'cart'

    # DEBUG / VERIFY
    save_screenshot

    puts page.html

    within('nav') { expect(page).to have_content('My Cart (1)') }

  end

end