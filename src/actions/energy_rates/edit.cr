class EnergyRates::Edit < BrowserAction
  get "/energy_rates/:energy_rate_id/edit" do
    html EditPage, op: SaveEnergyRate.new, rate: energy_rate
  end

  private def energy_rate
    EnergyRateQuery.new.preload_site.find(energy_rate_id)
  end
end
