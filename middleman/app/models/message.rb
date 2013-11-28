class Message < ActiveRecord::Base

  attr_accessible :text

  has_one :peer, :validate => true
  has_one :bug, :validate => true
end
