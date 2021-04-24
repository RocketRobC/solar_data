class EnergyRates::EditPage < MainLayout
  needs op : SaveEnergyRate
  needs rate : EnergyRate

  def content
    h1 "Edit Energy Rate"
    form
  end

  private def form
    form_for(EnergyRates::Update.with(energy_rate_id: rate.id)) do
      para do
        label_for(op.from_time)
        datetime_input(op.from_time, step: "1", value: rate.from_time.to_s)
        error_for(op.from_time)
      end

      para do
        label_for(op.to_time)
        datetime_input(op.to_time, step: "1", value: rate.to_time.to_s)
        error_for(op.to_time)
      end

      para do
        label_for(op.export_cents)
        number_input(op.export_cents, value: rate.export_cents)
        error_for(op.export_cents)
      end

      para do
        label_for(op.import_cents)
        number_input(op.import_cents, value: rate.import_cents)
        error_for(op.import_cents)
      end

      para do
        label_for(op.site_id, label: "Site")
        select_input(op.site_id) do
          # select_prompt("Select a site ID") if op.record.nil?
          options_for_select(op.site_id, site_options)
        end
      end

      submit("Save", class: "btn")
    end
  end

  private def error_for(field)
    mount Shared::FieldErrors, field
  end

  private def site_options
    SiteQuery.all.map do |site|
      {site.site_id, site.id}
    end
  end
end
