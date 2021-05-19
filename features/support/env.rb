require 'capybara'
require 'capybara/cucumber'
require 'appium_capybara'
require 'selenium-webdriver'
require 'appium_lib'
require 'json'
require 'pry'
require 'pry-nav'
require 'rack/test'
require 'rspec'
require 'ffaker'

$wait = Selenium::WebDriver::Wait.new(timeout: 60)

Dir.mkdir('exec-logs') unless File.exist?('exec-logs')

time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")

def load_appium_config platform
  file = File.read("#{Dir.pwd}/config/#{ENV['PLATFORM']}/appium.json")
  caps = JSON.parse(file)
  return caps
end

if ENV['PLATFORM'].nil?
  raise 'Favor definir a variavel de ambiente PLATFORM'
else
  env = ENV['PLATFORM'].downcase
end

Appium::Driver.new(load_appium_config(env), true)
Appium.promote_appium_methods Object
