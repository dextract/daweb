json.array!(@companies) do |company|
  json.extract! company, :id, :name, :logo, :homepage, :description
  json.url company_url(company, format: :json)
end
