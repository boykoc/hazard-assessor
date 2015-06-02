json.array!(@hazards) do |hazard|
  json.extract! hazard, :id, :name, :description, :exposure, :occurance, :probability, :consequence, :rating, :control
  json.url hazard_url(hazard, format: :json)
end
