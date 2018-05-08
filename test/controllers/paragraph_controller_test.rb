require 'test_helper'

class ParagraphControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get paragraphs_create_url
    assert_response :success
  end

  test "should get update" do
    get paragraphs_update_url
    assert_response :success
  end

end
