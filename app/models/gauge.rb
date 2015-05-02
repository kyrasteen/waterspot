class Gauge < ActiveRecord::Base

  def self.geo_format(gauges)
    GeoGauges.create(gauges)
  end

  # def self.find_all(state)
  #   gauges = service.gauges(state).map { |gauge| new(gauge) }
  #   GeoGauges.create(gauges)
  # end

end
