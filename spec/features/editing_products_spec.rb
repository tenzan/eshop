require 'rails_helper'

RSpec.feature 'Users can edit existing products' do

  before do
    FactoryGirl.create(:product, name: 'Shampoo', price: 33.44)
    visit '/'
    click_link 'Shampoo'
    click_link 'Edit Product'
  end

  scenario 'with valid attributes' do

    fill_in 'Name', with: 'Conditioner'
    fill_in 'Price', with: 44.55
    click_button 'Update Product'

    expect(page).to have_content 'Product has been updated.'
    expect(page).to have_content 'Conditioner'
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Product'

    expect(page).to have_content 'Product has not been updated.'
  end

end
