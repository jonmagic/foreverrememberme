require File.dirname(__FILE__) + '/../test_helper'

class TributeTest < Test::Unit::TestCase
  fixtures :tributes

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Tribute, tributes(:first)
  end
end
