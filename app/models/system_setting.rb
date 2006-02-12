class SystemSetting < ActiveRecord::Base

  def self.get_setting(name)
    if s = SystemSetting.find_by_name(name)
      s.value
    else
      raise "No system setting named #{name}"
    end
  end
  
  validates_presence_of :name
end
