json.array!(@setores) do |setor|
  json.extract! setor, :id, :codsetor, :nomesetor
  json.url setor_url(setor, format: :json)
end
