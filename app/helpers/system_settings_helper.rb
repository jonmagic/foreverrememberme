module SystemSettingsHelper
  def preference(name)
    SystemSetting.get_setting(name)
  end
end