class Gauge < OpenStruct

  def self.service
    @service ||= UsgsService.new
  end

  def self.find_all(state)
    gauges = service.gauges(state).map { |gauge| new(gauge) }
    make_geo_gauges(gauges)
  end

  private

  def self.make_geo_gauges(gauges)
    GeoGauges.create(gauges)
  end


end
