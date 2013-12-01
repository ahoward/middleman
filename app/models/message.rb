class Message < ActiveRecord::Base

  attr_accessible :text, :peer, :bug

  has_one :peer, :validate => true, :dependent => :delete
  has_one :bug, :validate => true, :dependent => :delete
end
