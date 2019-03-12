require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get resouces" do
    get trips_resouces_url
    assert_response :success
  end

end
