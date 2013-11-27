require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "creates Message" do
    assert ! Message.create(:email => 'foo').valid?
    assert ! Message.create(:email => 'foo@bar.com', :bug => '').valid?
    assert Message.create(:email => 'foo@bar.com', :bug => '2342').valid?
  end

end
