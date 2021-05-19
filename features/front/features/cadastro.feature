# enconding: utf-8
# language: pt

@regressivo
Funcionalidade: Cadastro
    Eu como usuário pessoa fisíca
    Gostaria de ralizar o cadastro no aplicativo do Ton

@cadastro_sucesso
Cenario: Cadastro de usuário válido
    Dado que acesso a tela inicial do app
    E clica no botão cadastrar
    E sou redirecionado para a tela de cadastro
    Quando preencho todos os campos com dados válidos
    Então verifico que o cadastro foi criado com sucesso
