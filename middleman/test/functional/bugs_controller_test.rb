require 'test_helper'

class BugsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "show specific bug" do
    get :show, :id => 3234
    assert_response :failure
  end

end
