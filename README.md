<h1 align="center">
📲 Ton Mobile Tests
</h1>
<p  align="center">🚀 Testes E2E de interfaces dos aplicativos Android e iOS do Ton.</p>
<h1  align="center">
<img  alt="npm"  src="https://img.shields.io/npm/v/appium?label=appium&logo=appium&style=flat-square">
<img alt="rubocop" src="https://img.shields.io/badge/code_style-rubocop-brightgreen.svg?style=flat-square">


 <h1 align="center">Começando 💻</h1>
Antes de começar, você vai precisar ter instalado em sua máquina todo o ambiente de desenvolvimento. Você pode consultar    como fazer em nosso tutorial.
- [Instalando as dependências](#setup)
- [Executando o projeto](#running)
- [O que já foi automatizado?](#fluxos)
- [Contribuindo](#contributing)
- [Stack](#stack)

<h2 align="center" name="setup">Instalando as dependências ⬇️</h2>
<h3>Pré-requisitos❗</h3>
Para executar as automações contidas nesse projeto é necessário ter instalado:
<li>Ruby</li>
<li>Appium 1.20.2</li>
<li>Emulador Android</li>
<li>Emulador iOS</li><br>

 Aqui você pode consultar como instalar o [Ruby], [Appium].
 Também será necessário configurar o [Emulador Android] e o [Simulador iOS.

<h3>Problemas ⚠️</h3>

É possível que ao instalar o Appium você tenha problemas com as variáveis de ambiente. Consulte o material sobre [JAVA JDK], [Android SDK] e como configurar as [Variáveis de Ambiente].

<h3>Instalação ⚙️</h3>

1. Para clonar o projeto, utilize o seguinte comando em seu terminal:
```bash
git clone https://github.com/ton-tests
```
2. Para instalar todas as dependências, basta executar:
```ruby
# Acesse a pasta do projeto no terminal/cmd
$ cd mobile-tests

# Instale a gem Bundler
$ gem install bundler

# Instale todas as dependências
$ bundle install
```
3. Acesse o arquivo *config/android/appium.json* ou *config/ios/appium.json*
4. Altere as informações das capabilities de acordo com o device que deseja executar os testes.

<h2 align="center" name="running">Executando o projeto ✅</h2>
<h3>Pré-requisitos❗</h3>

- É necessário ter em sua máquina local o arquivo das variáveis de ambiente da <b>AWS</b>, você pode consultar [aqui.](blank)
- Altere as tasks *ios* e *android* no arquivo *Rakefile* para executar os cenários desejados.

<h3>Executando os cenários:</h3>
Existem duas tasks configuradas, cuja automação pode ser executada utilizando os comandos contidos no arquivo <b>Rakefile</b>.

Para executar no iOS, navegue até a pasta do projeto e no seu terminal use o comando:
```ruby
$ rake ios
```

Para executar no Android, navegue até a pasta do projeto e no seu terminal use o comando:
```ruby
$ rake android
```
<h3>Executando cenários usando o Cucumber:</h3>

Para executar os cenários isoladamente você precisa acessar o caminho:
```ruby
# Acesse a pasta do projeto no terminal/cmd
$ cd features/front

#Exemplo iOS
$ cucumber -t @login PLATFORM=ios

#Exemplo Android
$ cucumber -t @login PLATFORM=android
```

<h2 align="center" name="fluxos">O que já foi automatizado?</h2>
<p align="center">Quer saber quais cenários já foram automatizados? Acompanhe <a href="">aqui</a>.</p>


<h2 align="center" name="contributing">Contribuindo com o Projeto 🔄</h2>
<p align="center">Para contribuir com o projeto consulte nosso CONTRIBUTING</a>.</p>

<h1  align="center" name="stack">
Stack
</h1>
<p  align="center">
<img  src="https://img.shields.io/badge/ruby-CB0202?style=for-the-badge&logo=ruby"/>
<img  src="https://img.shields.io/badge/selenium-000000?style=for-the-badge&logo=selenium"/>
<img  src="https://img.shields.io/badge/cucumber-000000?style=for-the-badge&logo=cucumber"/>
<img  src="https://img.shields.io/badge/Browserstack-FF9900?style=for-the-badge&logo=browserstack"/>
<img  src="https://img.shields.io/badge/Amazon s3-232F3E?style=for-the-badge&logo=amazon-s3"/>
</p>
