# depois de cada cenario ele tira um print e remove todos os espacos virgulas
After do |scenario|
  p scenario_name = scenario.name.gsub(/[^A-Za-z ]/, '').gsub(/\s+/, '_')

  # se o cenario falha ele vai chamar o metodo take passando
  # dois parametros o nome do cenario com nome minusculo e o resultado
  if scenario.failed?
    take_screenshot(file_name: scenario_name.downcase!, test_result: 'failed')
  else
    take_screenshot(file_name: scenario_name.downcase!, test_result: 'passed')
  end
end