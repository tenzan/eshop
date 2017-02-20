
feature 'Users can only see the appropriate links' do
  let(:product) { FactoryGirl.create(:product) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context "anonymous users" do
    scenario "cannot see the New Product link" do
      visit '/'
      expect(page).not_to have_link 'New Product'
    end
    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"
    end
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Edit Product"
    end
  end

  context "reguler users" do
    before { login_as(user) }

    scenario "cannot see the New Product link" do
      visit "/"
      expect(page).not_to have_link "New Product"
    end
    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"
    end
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Edit Product"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the New Product link" do
      visit '/'
      expect(page).to have_link 'New Product'
    end
    scenario "can see the Delete Product link" do
      visit product_path(product)
      expect(page).to have_link "Delete Product"
    end
    scenario "can see the Edit Product link" do
      visit product_path(product)
      expect(page).to have_link "Edit Product"
    end
  end
end
