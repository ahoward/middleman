class Message < ActiveRecord::Base

  attr_accessible :bug, :email, :text

  validates_presence_of :bug, :email

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
