class Gauge < ActiveRecord::Base

  def self.geo_format(gauges)
    GeoGauges.create(gauges)
  end

  def self.service
    @service ||= UsgsService.new
  end

  def self.update_values
    STATES.each do |state|
    service.gauges(state)["timeSeries"].each do |gauge|
      found_gauge = find_by( name: gauge['sourceInfo']["siteName"])
      found_gauge.update_attributes(value: gauge['values'][0]['value'][0]['value'])
    end
  end

  STATES = [
          "al","ak","az","ar","ca","co",
          "ct","de","dc","fl","ga","hi",
          "id","il","in","ia","ks","ky",
          "la","me","md","ma","mi","mn",
          "ms","mo","mt","ne","nv","nh",
          "nj","nm","ny","nc","nd","oh",
          "ok","or","pa","ri","sc","sd",
          "tn","tx","ut","vt","va","wa",
          "wv","wi","wy"
        ]
end
