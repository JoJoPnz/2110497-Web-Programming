require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get main_login_url
    assert_response :success
  end

  test "should get user_Items" do
    get main_user_Items_url
    assert_response :success
  end
end
