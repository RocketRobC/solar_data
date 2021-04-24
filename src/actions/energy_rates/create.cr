class EnergyRates::Create < BrowserAction
  post "/energy_rates" do
    puts params.inspect
    SaveEnergyRate.create(params) do |op, rate|
      if rate
        redirect to: EnergyRates::Index
      else
        html NewPage, op: op
      end
    end
  end
end
