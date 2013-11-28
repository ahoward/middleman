require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "creates Message" do
    assert Message.create(:text => '').valid?
    assert Message.create().valid?
  end

end
