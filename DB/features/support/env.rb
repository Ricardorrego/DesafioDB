require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'
require 'rspec'
require 'rspec/retry'
require_relative 'page_helper.rb'
require_relative '../framework/helper.rb'

# adicionando as bibliotecas no contexto do capybara.
World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)
include Helper

# variaveis de ambiente.
HEADLESS = ENV['HEADLESS']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file(File.dirname(__FILE__) +
                            "/data/#{ENVIRONMENT_TYPE}.yml")
LOGIN = CONFIG['login']
SENHA = CONFIG['senha']

# instanciando o driver.
Capybara.register_driver :selenium do |app|

  if HEADLESS.eql?('sem_headless')
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => {'args' => ['--disable-infobars', '--start-maximized']}
        )
    )
  elsif HEADLESS.eql?('com_headless')
    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => {'args' => ['headless', 'disable-gpu',
                                           '--disable-infobars',
                                           'window-size=1600,1024']}
        )
    )
  end
end

# seta as configuracoes do capybara.
Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 30
  config.app_host = CONFIG['url_home']
end

# O siteprism pega o tempo do timeout do capybara
SitePrism.configure do |config|
  config.use_implicit_waits = true
end

# tratamento de erros de conexao.
RSpec.configure do |config|
  config.verbose_retry = true
  config.default_retry_count = 3
  config.exceptions_to_retry = [Net::ReadTimeout]
end