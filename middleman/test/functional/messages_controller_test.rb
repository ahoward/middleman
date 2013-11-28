require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "create message" do
    post :create, :format => :json, :bug => '23423'
    assert_response :unprocessable_entity

    form = {
      :format => :json,
      :email => 'foo@bar.com',
      :bug => '#21332',
      :text => 'Foobar',
    }
    assert_difference('Message.count') do
      post :create, form
    end
    assert_response :success

    assert_no_difference('Message.count') do
      post :create, form
    end
    assert_response :success
  end

end
