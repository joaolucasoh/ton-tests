require 'yaml'
require 'logger'

def get_screen_mappings(screen, package)
  $platform = ENV['PLATFORM'].downcase
  dir = "#{Dir.pwd}/features/#{package}/elements/screen_mappings_#{screen}.yaml"
  screen_mappings = YAML.load_file(dir)
  $mappings = screen_mappings[$platform]
end
