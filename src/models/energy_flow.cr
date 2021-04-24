class EnergyFlow
  getter :api

  def initialize(@api : ApiRequester)
  end

  def export_kwh
    get_reading_for("FeedIn")
  end

  def import_kwh
    get_reading_for("Purchased")
  end

  private def get_reading_for(value)
    dataset = data["energyDetails"]["meters"].as_a.select do |reading|
      reading["type"] == value
    end
    dataset.first["values"].as_a.first["value"].as_f32 / 1000
  end

  private def data
    @data ||= JSON.parse(api.data)
  end
end
