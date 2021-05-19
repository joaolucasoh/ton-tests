# frozen_string_literal: true

desc 'Inicia servidor Appium'
task :appium_server do
  puts 'Iniciando server do appium'
  system 'nohup appium &'
end

desc 'Encerra servidor Appium'
task :close_appium_server do
  puts 'Fechando conexão do server do appium'
  system "ps -ef | grep -v grep | grep appium | awk '{print $2}' |
  xargs kill -9"
end

desc 'Executa testes ios local'
task :ios do
  sh 'rake appium_server'
  sh "bundle exec cucumber -t @login PLATFORM=ios"
end

desc 'Executa testes android local'
task :android do
  sh 'rake appium_server'
  sh 'bundle exec cucumber -t @transferenciapix PLATFORM=android'
end
