json.array!(@filiais) do |filial|
  json.extract! filial, :id, :nomefilial, :uf, :telefone
  json.url filial_url(filial, format: :json)
end
