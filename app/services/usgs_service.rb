class UsgsService
  attr_reader :connection

 def initialize
   @connection = Faraday.new(url: "http://waterservices.usgs.gov/nwis/dv/?format=json")
 end

 def gauges(state)
   parse(connection.get("&parameterCd=00060&siteType=ST&siteStatus=active&stateCd=#{state}"))
 end
end
