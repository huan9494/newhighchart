require 'test_helper'

class IncomeCatagoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get income_catagories_index_url
    assert_response :success
  end

  test "should get edit" do
    get income_catagories_edit_url
    assert_response :success
  end

  test "should get update" do
    get income_catagories_update_url
    assert_response :success
  end

  test "should get create" do
    get income_catagories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get income_catagories_destroy_url
    assert_response :success
  end

end
