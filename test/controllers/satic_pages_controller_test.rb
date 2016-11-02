require 'test_helper'

class SaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get satic_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get satic_pages_help_url
    assert_response :success
  end

end
