require 'rails_helper'

RSpec.describe "Users can delete products" do
  scenario 'successfully' do
    FactoryGirl.create(:product, name: 'Shampoo', price: 33.44)

    visit '/'
    click_link 'Shampoo'
    click_link 'Delete Product'

    expect(page).to have_content 'Product has been deleted.'
    expect(page.current_url).to eq products_url
    expect(page).to have_no_content 'Shampoo'
  end
end
