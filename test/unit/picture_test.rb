require File.dirname(__FILE__) + '/../test_helper'

class PictureTest < Test::Unit::TestCase
  fixtures :pictures

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Picture, pictures(:first)
  end
end
