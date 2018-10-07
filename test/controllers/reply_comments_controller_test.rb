require 'test_helper'

class ReplyCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reply_comments_create_url
    assert_response :success
  end

end
