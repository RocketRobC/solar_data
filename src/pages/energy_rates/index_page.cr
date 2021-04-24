class EnergyRates::IndexPage < MainLayout
  needs rates : EnergyRateQuery

  def content
    h1 "Rates"
    link("New", to: EnergyRates::New)
    table do
      tr do
        th "Start Time"
        th "End Time"
        th "Export"
        th "Import"
        th "Site"
      end
      rates.each do |rate|
        tr do
          td { link rate.from_time.to_s, EnergyRates::Edit.with(rate) }
          td rate.to_time.to_s
          td rate.export_cents
          td rate.import_cents
          td rate.site.site_id
        end
      end
    end
  end
end
