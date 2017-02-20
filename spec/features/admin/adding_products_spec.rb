require 'rails_helper'

RSpec.feature 'Users can add new products' do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit '/'
    click_link 'New Product'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Shampoo'
    fill_in 'Description', with: 'New shampoo'
    fill_in 'Price', with: 33.00

    click_button 'Create Product'

    expect(page).to have_content 'Product has been created.'

    product = Product.find_by(name: 'Shampoo')
    expect(page.current_url).to eq product_url(product)

    title = 'Shampoo - Eshop'
    expect(page).to have_title title
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Product'

    expect(page).to have_content 'Product has not been created.'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Price can't be blank"
  end
end
