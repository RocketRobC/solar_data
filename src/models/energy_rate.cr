class EnergyRate < BaseModel
  table do
    column export_cents : Int32
    column import_cents : Int32
    column from_time : Time
    column to_time : Time

    belongs_to site : Site
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
