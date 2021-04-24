class SaveEnergyRate < EnergyRate::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  permit_columns to_time, from_time, export_cents, import_cents, site_id
end
