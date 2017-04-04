require 'test_helper'

class ExpenditureCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenditure_categories_index_url
    assert_response :success
  end

  test "should get edit" do
    get expenditure_categories_edit_url
    assert_response :success
  end

  test "should get update" do
    get expenditure_categories_update_url
    assert_response :success
  end

  test "should get create" do
    get expenditure_categories_create_url
    assert_response :success
  end

  test "should get destroy" do
    get expenditure_categories_destroy_url
    assert_response :success
  end

end
