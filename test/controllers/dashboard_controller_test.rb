require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get dashboard_welcome_url
    assert_response :success
  end

end
