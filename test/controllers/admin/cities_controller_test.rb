require 'test_helper'

class Admin::CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cities_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_cities_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_cities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_cities_destroy_url
    assert_response :success
  end

end
