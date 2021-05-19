Dado('que eu esteja na tela de login') do
  $logger.info('Iniciou o teste')
  @login = LoginPage.new
end

Dado('que eu preencha o campo {string} e {string}') do |usuario, senha|
  @login.preenche_login(usuario, senha)
end

Dado('clique sobre o botão entrar') do
  @login.tap_entrar_interno
end

Então('eu realizo o login com sucesso na aplicação') do
  @login.verifica_home
end
