require 'test_helper'

class CasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get categoria" do
    get :categoria
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
