Before do
  $driver.start_driver
end

# Before('@login') do
#   # @login = LoginPage.new
#   # dir = "#{Dir.pwd}/features/front/massa/login.yaml"
#   # user = YAML.load_file(dir)[$platform]['usuario']
#   # $password = YAML.load_file(dir)[$platform]['senha']
#   # # @login.tap_entrar
#   # $wait.until { @login.preenche_login(user, $password) }
#   # @login.tap_entrar_interno
# end

After do
  $driver.driver_quit
  $logger.info("Fim do teste")
end
