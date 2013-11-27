require 'test_helper'

class PeerTest < ActiveSupport::TestCase

  test "create peer" do
    assert !Peer.create(:email => '').valid?
    assert  Peer.create(:email => 'foo@bar.com').valid?
  end

end
