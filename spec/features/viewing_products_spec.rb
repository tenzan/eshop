require 'rails_helper'

feature 'Users can view products' do
  scenario 'with the product details' do
    product = FactoryGirl.create(:product, name: 'Shampoo', price: 11.22)
    visit '/'
    click_link 'Shampoo'
    expect(page.current_url).to eq product_url(product)
  end
end
