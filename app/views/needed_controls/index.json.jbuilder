json.array!(@needed_controls) do |needed_control|
  json.extract! needed_control, :id, :hazard_id, :content, :completed
  json.url needed_control_url(needed_control, format: :json)
end
