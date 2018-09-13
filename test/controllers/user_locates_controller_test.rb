require 'test_helper'

class UserLocatesControllerTest < ActionDispatch::IntegrationTest
  test "should get :update" do
    get user_locates_:update_url
    assert_response :success
  end

end
