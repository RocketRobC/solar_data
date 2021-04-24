class EnergyRates::New < BrowserAction
  get "/energy_rates/new" do
    html EnergyRates::NewPage, op: SaveEnergyRate.new
  end
end
