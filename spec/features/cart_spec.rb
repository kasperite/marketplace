require 'rails_helper'

RSpec.describe Cart, type: :feature do
  scenario 'add product to cart' do
    product1 = FactoryBot.create(:product, price: 100)
    product2 = FactoryBot.create(:product, price: 200)
    visit products_path
    within "#product-#{product1.id}" do
      click_on 'Add'
    end
    expect(page).to have_content "TOTAL: $1.00"
  end
end