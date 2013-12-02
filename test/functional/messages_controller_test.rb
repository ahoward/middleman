require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  setup do
    @form = {
      :format => :text,
      :email => 'foo@bar.com',
      :bug => '#21332',
      :text => 'Foobar',
    }
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "create message" do
    post :create, :format => :text, :bug => '23423'
    assert_response :unprocessable_entity

    assert_difference('Message.count') do
      post :create, @form
    end
    assert_response :success

    message = Message.last
    assert_no_difference('Message.count') do
      post :create, @form
    end
    assert_response :success
    assert message.updated_at < Message.last.updated_at
  end

  test "work on different bugs" do
    assert_difference('Message.count') do
      post :create, @form
    end
    assert_not_nil Message.last.peer
    assert_not_nil Message.last.bug

    different = @form.clone
    different[:bug] = '#2312'
    assert_difference('Message.count') do
      post :create, different
    end
    assert_not_nil Message.last.peer
    assert_equal   Peer.find_by_email(different[:email]), Message.last.peer
    assert_not_nil Message.last.bug
    assert_equal   Bug.find(2312), Message.last.bug

    assert_no_difference('Message.count') do
      post :create, @form
    end
  end


  test "conflict" do
    post :create, @form
    assert_response :success
    assert_match(/middleman.*\d+$/, response.body)

    @form['email'] = 'other@user.com'
    post :create, @form
    assert_response :success
    assert_match(/CONFLICT/, response.body)
  end

  test "delete message" do
    assert_difference ['Message.count', 'Peer.count', 'Bug.count'], -1 do
      delete :destroy, :id => Message.first.id
    end
    assert_response :redirect
  end

end
