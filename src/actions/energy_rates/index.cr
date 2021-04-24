class EnergyRates::Index < BrowserAction
  get "/energy_rates" do
    html EnergyRates::IndexPage, rates: EnergyRateQuery.new.preload_site
  end
end
