require 'test_helper'

class ExpendituresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenditures_index_url
    assert_response :success
  end

  test "should get edit" do
    get expenditures_edit_url
    assert_response :success
  end

  test "should get update" do
    get expenditures_update_url
    assert_response :success
  end

  test "should get create" do
    get expenditures_create_url
    assert_response :success
  end

  test "should get destroy" do
    get expenditures_destroy_url
    assert_response :success
  end

end
