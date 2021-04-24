class Site < BaseModel
  table do
    column site_id : String
    column api_key : String
    column base_api_url : String

    has_many energy_rates : EnergyRate
  end
end
