class Gauge < ActiveRecord::Base

  def self.service
    @service ||= UsgsService.new
  end

  def self.create_from_api(params)
    gauges(params).each do |gauge|
      Gauge.make(gauge, params)
    end
  end

  def self.make(gauge, state)
      Gauge.create(
        lat: gauge['sourceInfo']['geoLocation']['geogLocation']['latitude'],
        long: gauge['sourceInfo']['geoLocation']['geogLocation']['longitude'],
        name: gauge['sourceInfo']["siteName"],
        value: gauge['values'][0]['value'][0]['value'],
        state: state
      )
  end

  def self.gauges(state)
    service.gauges(state)
  end

  def self.update_values(state)
    gauges(state).each do |gauge|
      update_gauge(gauge, state)
    end
  end

  def self.update_gauge(gauge, state)
    found_gauge = find_by( name: gauge['sourceInfo']["siteName"])
    if found_gauge
      found_gauge.update_attributes(value: gauge['values'][0]['value'][0]['value'])
    else
     Gauge.make(gauge, state)
    end
  end
end
