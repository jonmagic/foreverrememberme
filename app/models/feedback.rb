class Feedback < ActiveRecord::Base
  set_table_name "feedback"
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
