require 'application_system_test_case'

class Auth::WholesalerLoginTest < ApplicationSystemTestCase
  setup do
    business = create(:business_with_address)
    @user = business.owner
  end

  test "login" do
    visit root_path
    click_on 'Log in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'secret'

    click_on 'Log in'

    assert_selector 'h1', text: 'Dashboard'
  end
  
end
