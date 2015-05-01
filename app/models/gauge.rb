class Gauge < OpenStruct

  def self.service
    @service ||= UsgsService.new
  end

  def self.find_all(state)
    gauges = service.gauges(state).map { |gauge| new(gauge) }
    GeoGauges.create(gauges)
  end

end
