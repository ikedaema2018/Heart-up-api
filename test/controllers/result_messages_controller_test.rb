require 'test_helper'

class ResultMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get :update" do
    get result_messages_:update_url
    assert_response :success
  end

  test "should get :show" do
    get result_messages_:show_url
    assert_response :success
  end

end
