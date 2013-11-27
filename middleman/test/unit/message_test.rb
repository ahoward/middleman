require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "creates Message" do
    assert ! Message.create(:bug => '').valid?
    assert Message.create(:bug => '2342').valid?
  end

end
