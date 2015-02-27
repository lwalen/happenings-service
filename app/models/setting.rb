class Setting < ActiveRecord::Base
  def self.[](key)
    self.find_by_setting_key(key.to_s).setting_value
  end

  def self.[]=(key, value)
    self.create(setting_key: key.to_s, setting_value: value.to_s)
  end
end
