Dado('que acesso a tela inicial do app') do
  $logger.info('Iniciou o teste')
  @register = RegisterPage.new
end

Dado('clica no botão cadastrar') do
  @register.tap_register
end

Dado('sou redirecionado para a tela de cadastro') do
  @register.validate_register_page
end

Quando('preencho todos os campos com dados válidos') do
  @register.input_register
end

Então('verifico que o cadastro foi criado com sucesso') do
  @register.register_analyse
end
