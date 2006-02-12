require File.dirname(__FILE__) + '/../test_helper'

class SystemSettingTest < Test::Unit::TestCase
  fixtures :system_settings

  # Replace this with your real tests.
  def test_truth
    assert_kind_of SystemSetting, system_settings(:first)
  end
end
