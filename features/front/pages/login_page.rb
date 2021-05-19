require 'rspec/expectations'

class LoginPage
  include RSpec::Matchers

  def initialize
    get_screen_mappings 'login', 'front'
  end

  def preenche_login(usuario, senha)
    $wait.until { text_exists?('Ficou mais fácil')}
    click_by_text('Entrar')
    fill_in $mappings['campo_login'], usuario
    fill_in $mappings['campo_senha'], senha
    click $mappings['btn_entrar_login']
  end

  def tap_entrar_interno
    $logger.info('Clicou no botão entrar da pagina de login')
  end

  def verifica_home
    expect($wait.until { element_exists? $mappings['label_meu_saldo'] }).to be_truthy
  end
end
