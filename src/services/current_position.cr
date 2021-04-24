class CurrentPosition
  getter :imported_kwh, :exported_kwh

  def initialize(@rates : EnergyRate, @imported_kwh : Float32, @exported_kwh : Float32)
  end

  def required_export
    imported_kwh * @rates.ratio
  end

  def in_kwh
    exported_kwh - required_export
  end

  def as_money
    if in_kwh == 0
      0
    elsif in_kwh < 0
      in_kwh * @rates.import_dollars
    else
      in_kwh * @rates.export_dollars
    end
  end

  def formatted_cost
    if as_money >= 0
      formatted_export(as_money)
    else
      formatted_import(as_money)
    end
  end

  private def formatted_export(amount)
    "$#{amount.round(2)} return for export"
  end

  private def formatted_import(amount)
    "$#{amount.round(2)} in electicity costs"
  end
end
