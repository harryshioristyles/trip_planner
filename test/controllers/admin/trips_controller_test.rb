require 'test_helper'

class Admin::TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_trips_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_trips_edit_url
    assert_response :success
  end

end
