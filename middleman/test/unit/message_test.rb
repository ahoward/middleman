require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "creates message" do
    assert Message.create(:text => '').valid?
    assert Message.create().valid?
    m = Message.create(:bug => Bug.from_string('323423'), :peer => Peer.new(:email => 'frob@frab.com'))
    assert m.valid?
  end

end
