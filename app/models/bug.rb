class Bug < ActiveRecord::Base
  belongs_to :message
  validate :bug_valid

  def self.from_string(bugid_string)
    bugid = convert_bugstr(bugid_string)

    bug = Bug.find_by_id(bugid)
    unless bug
      bug = Bug.new
      bug.id = bugid
    end
    bug
  end

  private

  #
  # Converts the bug string to a numerical id. Returns 0 if the bug
  # string can not be converted.
  #
  def self.convert_bugstr(bugstr)
    bugstr.match(/\d+/).to_s.to_i
  end

  def bug_valid
    errors.add(:id, "Invalid bug id: #{id}") unless id > 0
  end

end
