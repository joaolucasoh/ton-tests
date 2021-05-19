      # enconding: utf-8
      # language: pt

      @regressivo
      Funcionalidade: Login
      Na tela de login
      Como usuário pessoa fisica
      Desejo realizar o login no app

      @login_sucess
      Esquema do Cenário: Realizar login com sucesso
      Dado que eu esteja na tela de login
      E que eu preencha o campo <login> e <senha>
      E clique sobre o botão entrar
      Então eu realizo o login com sucesso na aplicação

      Exemplos:
      | login                      | senha       |
      | 'joaolucas_oh@outlook.com' | 'mudar@123' |
