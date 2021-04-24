class EnergyRates::Update < BrowserAction
  put "/energy_rates/:energy_rate_id" do
    SaveEnergyRate.update(energy_rate, params) do |op, rate|
      if op.saved?
        redirect to: EnergyRates::Index
      else
        html EditPage, op: op, rate: rate
      end
    end
  end

  private def energy_rate
    EnergyRateQuery.new.preload_site.find(energy_rate_id)
  end
end
