class Message < ActiveRecord::Base

  attr_accessible :bug, :text

  validates_presence_of :bug

  has_one :peer, :validate => true
end
