class HomePage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'home', 'front'
  end

  def click_settings
    click $mappings['btn_settings']
  end
end
