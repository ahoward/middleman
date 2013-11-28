require 'test_helper'

class BugsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "show specific bug" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => 3234
    end

    get :show, :id => Bug.last.id
    assert_response :success
  end

end
