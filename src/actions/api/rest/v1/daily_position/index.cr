class Api::Rest::V1::DailyPosition::Index < ApiAction
  get "/api/rest/v1/daily_position" do
    json(payload)
  end

  private def payload
    {
      balance_text: position.formatted_cost,
      balance: position.as_money.round(2),
      kwh_diff: position.in_kwh,
      required_export: position.required_export,
      export: position.exported_kwh
    }
  end

  # TODO the energy rate is hardcoded to the first one for the site. This should
  # be calcualted for the specific times of the day for the case where rates change
  # throughout the day. 
  private def position
    @position ||= CurrentPosition.new(site.energy_rates.first, flow_for_period.import_kwh, flow_for_period.export_kwh)
  end

  private def flow_for_period
    @flow_for_period ||= EnergyFlow.new(ApiRequester.new(
                                        Time.local.at_beginning_of_day.to_s("%F %H:%M:%S"),
                                        Time.local.at_end_of_day.to_s("%F %H:%M:%S"),
                                        site))
  end

  # TODO currently this is hardcoded to the first site. The site should be selectable
  # through the request.
  private def site
    SiteQuery.new.preload_energy_rates.first
  end
end
