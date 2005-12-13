require File.dirname(__FILE__) + '/../test_helper'

class MemorialTest < Test::Unit::TestCase
  fixtures :memorials

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Memorial, memorials(:first)
  end
end
