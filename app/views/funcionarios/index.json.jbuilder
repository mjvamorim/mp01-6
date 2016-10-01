json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :matricula, :nome, :endereco, :telefone, :salario
  json.url funcionario_url(funcionario, format: :json)
end
