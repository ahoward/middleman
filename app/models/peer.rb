class Peer < ActiveRecord::Base
  belongs_to :message
  attr_accessible :email
  validates_presence_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
