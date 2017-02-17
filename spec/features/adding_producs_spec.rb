require 'rails_helper'

RSpec.feature 'Users can add new products' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Product'

    fill_in 'Name', with: 'Shampoo'
    fill_in 'Description', with: 'New shampoo'
    fill_in 'Price', with: 33.00

    click_button 'Create Product'

    expect(page).to have_content 'Product has been created.'
  end
end
