require 'test_helper'

class StaticContentControllerTest < ActionController::TestCase
  test "should get advantages" do
    get :advantages
    assert_response :success
  end

  test "should get acquisition" do
    get :acquisition
    assert_response :success
  end

end
