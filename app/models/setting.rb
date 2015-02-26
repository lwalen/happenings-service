class Setting < ActiveRecord::Base
  def self.[](key)
    self.find_by_setting_key(key.to_s).setting_value
  end
end
