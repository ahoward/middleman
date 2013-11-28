class Message < ActiveRecord::Base

  attr_accessible :text, :peer, :bug

  has_one :peer, :validate => true
  has_one :bug, :validate => true
end
