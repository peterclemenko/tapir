module SettingsHelper

  def tapir_setting_url
    "/settings"
  end

  def tapir_settings_path(settings=nil)
    "/settings"
  end

  def tapir_setting_path(setting=nil, temp=nil)
    "/settings/#{setting._id}"
  end

end
