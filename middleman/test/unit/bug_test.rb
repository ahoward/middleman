require 'test_helper'

class BugTest < ActiveSupport::TestCase

  test "create bug" do
    b = Bug.new
    b.id = 12312
    assert b.valid?
  end

  test "create bug from bug string" do
    assert !Bug.from_string('frob').valid?
    assert Bug.from_string('23412').valid?
    assert Bug.from_string('#2312').valid?

    b = Bug.new
    b.id = 123123
    b.save
    assert_equal b, Bug.from_string('123123')
  end

end
