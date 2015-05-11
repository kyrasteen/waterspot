class Gauge < ActiveRecord::Base

  def self.service
    @service ||= UsgsService.new
  end

  def self.update_values(state)
    gauges(state).each do |gauge|
      update_gauge(gauge)
    end
  end

  def self.create_from_api(params)
    gauges(params).each do |gauge|
      Gauge.create(
        lat: gauge['sourceInfo']['geoLocation']['geogLocation']['latitude'],
        long: gauge['sourceInfo']['geoLocation']['geogLocation']['longitude'],
        name: gauge['sourceInfo']["siteName"],
        value: gauge['values'][0]['value'][0]['value'],
        state: params
      )
    end
  end

  def self.gauges(state)
    service.gauges(state)["timeSeries"]
  end

  def self.update_gauge(gauge)
    found_gauge = find_by( name: gauge['sourceInfo']["siteName"])
    found_gauge.update_attributes(value: gauge['values'][0]['value'][0]['value'])
  end
end
