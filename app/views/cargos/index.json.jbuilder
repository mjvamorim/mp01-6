json.array!(@cargos) do |cargo|
  json.extract! cargo, :id, :codcargo, :nomecargo, :salariobase
  json.url cargo_url(cargo, format: :json)
end
