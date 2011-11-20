require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  test "should get make" do
    get :make
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
    assert_not_nil assigns(:wishes)
  end

end
