class Gauge < OpenStruct

  def self.service
    @service ||= UsgsService.new
  end

  def self.all
    service.gauges.map { |gauge| new(gauge) }
  end


end
