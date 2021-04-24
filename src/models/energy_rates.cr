class EnergyRates
  getter :import_cents, :export_cents

  def initialize(@import_cents : Int32, @export_cents : Int32)
  end

  def ratio
    import_cents / export_cents
  end

  def import_dollars
    in_dollars(import_cents)
  end

  def export_dollars
    in_dollars(export_cents)
  end

  private def in_dollars(cents)
    cents / 100
  end
end
