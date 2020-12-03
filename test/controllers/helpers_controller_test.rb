require 'test_helper'

class HelpersControllerTest < ActionDispatch::IntegrationTest
  test "should get find_house" do
    get helpers_find_house_url
    assert_response :success
  end

end
