require 'rails_helper'

RSpec.describe Cart, type: :feature do
  scenario 'add product to cart' do
    product = FactoryBot.create(:product, price: 1000)
    visit products_path
    within "#product-#{product.id}" do
      click_on 'Add'
    end
    expect(page).to have_content "TOTAL: $10.00"
  end

  scenario 'add products with discount' do
    product1 = FactoryBot.create(:product, price: 1000)
    product2 = FactoryBot.create(:product, price: 2000)
    promotion = FactoryBot.create(:promotion, threshold: 1500, discount_rate: 10)
    visit products_path
    within "#product-#{product1.id}" do
      click_on 'Add'
    end
    within "#product-#{product2.id}" do
      click_on 'Add'
    end
    expect(page).to have_content "TOTAL: $27.00"
    expect(page).to have_content promotion.description
  end
end