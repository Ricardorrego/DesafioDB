desc "Executar os testes em dev usando o Chrome"
task :test_chrome_dev do
  puts "Executando test:chrome:dev"
  sh "cucumber -p pretty -p html -p dev -p sem_headless"
end

desc "Executar os testes em dev usando o Chrome headless"
task :test_chrome_dev_headless do
  puts "Executando test:chrome:dev"
  sh "cucumber -p html -p dev -p com_headless"
end

desc "Executar os testes em hmg usando o Chrome"
task :test_chrome_hmg do
  puts "Executando test:chrome:dev"
  sh "cucumber -p pretty -p html -p homolog -p sem_headless"
end

desc "Executar os testes em hmg usando o Chrome headless"
task :test_chrome_hmg_headless do
  puts "Executando test:chrome:dev"
  sh "cucumber -p html -p homolog -p com_headless"
end
