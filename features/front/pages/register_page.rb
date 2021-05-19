require 'rspec/expectations'
require 'ffaker'
require 'cpf_faker'
require 'selenium-webdriver'
require_relative './home_page.rb'

class RegisterPage < HomePage
  include RSpec::Matchers

    def initialize
      get_screen_mappings 'register', 'front'
    end

    def tap_register
      $logger.info('Clicou no botão cadastrar')
      $wait.until { text_exists?('Ficou mais fácil')}
      click_by_text('Criar conta')
      element_exists?($mappings['title_novo_cadastro'])
      click $mappings['btn_nao_sou_cliente']
    end

    def validate_register_page
      $logger.info('Estou na tela de cadastro')
      text_exists?('Que tipo de conta você quer criar?')
    end

    def input_register
      $logger.info('Então preencho os campos de cadastro')
      click $mappings['btn_para_vc_option']
      click $mappings['btn_criar_minha_conta']
      fill_in $mappings['input_cpf'], Faker::CPF.numeric
      hide_keyboard
      fill_in $mappings['input_name'], 'Ton Stone'
      fill_in $mappings['input_birthday'], '05/05/1995'
      click_by_text('Continuar')
      fill_in $mappings['input_mobile_number'], "11990001011"
      fill_in $mappings['input_email'], FFaker::Internet.email
      click_by_text('Continuar')
      fill_in $mappings['input_mom_name'], FFaker::Name.name_with_middle
      click_by_text('Continuar')

      $name = get_text($mappings['input_name'])
      fill_in($mappings['input_lastname'], FFaker::Name.last_name)
      $last_name = get_text($mappings['input_lastname'])
      button_next
      fill_in($mappings['input_DDD'], '11')
      @ddd = get_text($mappings['input_DDD'])
      phone_number
      @number = get_text($mappings['input_number'])
      click $mappings['btn_sms']
      validate_phone
      get_code
      click_by_text('Editar')
      click $mappings['link_skip_code']
      fill_in($mappings['input_sms_code'], @code)
      email_picpay
      click $mappings['btn_btnext']
      fill_in($mappings['input_password'], '1234')
      click $mappings['btn_finish']
    end

    def button_next
      $logger.info('Clico em avançar')
      click $mappings['btn_next']
    end

    def phone_number
      fill_in($mappings['input_number'], "9#{rand(1111_1111...9999_9999).to_s}")
    end

    def validate_phone
      case ENV['PLATFORM']
        when 'android'
          text1 = get_text($mappings['txt_number_and_code'])
          text2 = "(#{@ddd}) #{@number}"
          click_by_text('Sim') if text1.include? text2
        when 'ios'
          click $mappings['btn_ok']
      end
    end

    def get_code
      case ENV['PLATFORM']
        when 'android'
          @sms_code = get_text($mappings['txt_number_and_code'])
          @code = @sms_code.scan(/\d+/)
          $logger.info("Código: #{@code}")
        when 'ios'
          element_exists? $mappings['txt_sms_code']
          @sms_code = get_text($mappings['txt_sms_code'])
          @code = @sms_code.scan(/\d+/)
          $logger.info("Código: #{@code}")
      end
    end

    def email_picpay
      fill_in($mappings['input_email'], "#{$name}_#{FFaker::Code::ean}@picpay.com")
    end

    def get_username
      $username = get_text($mappings['input_username'])
      $logger.info("Username criado: #{$username}")
    end

    def register_analyse
      $wait.until { register_return }
      case @return_msg
      when 'Parabéns, sua conta foi criada!'
        continue_registration
        @home = HomePage.new
        @home.click_settings
        @settings = SettingsPage.new
        @settings.validate_register
      when 'Cadastro em análise'
        $logger.info("O cadastro está em análise")
      end
    end

    def continue_registration
      click $mappings['btn_review_confirm']
      get_username
      click $mappings['btn_username_next']
      click $mappings['link_skip_step']
      click $mappings['link_skip_step']
      click $mappings['link_close_onboarding']
      click $mappings['link_close_tutorial']
      click $mappings['link_close_onboarding_pix']
    end

    def register_return
      if text_exists?('criada')
        @return_msg = get_text($mappings['title_review'])
      elsif text_exists?('análise')
        @return_msg = get_text($mappings['title_review_analyze'])
      end
    end
end
