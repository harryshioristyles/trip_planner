require 'test_helper'

class Admin::ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_activities_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_activities_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_activities_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_activities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_activities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_activities_destroy_url
    assert_response :success
  end

end
