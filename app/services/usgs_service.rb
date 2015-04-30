class UsgsService
  attr_reader :connection

 def initialize
   @connection = Faraday.new(url: "http://waterservices.usgs.gov/nwis/dv/")
 end

 #try with colorado first
 def gauges(state)
   parse(connection.get("?format=json&parameterCd=00060&siteType=ST&siteStatus=active&stateCd=#{state}"))
 end

 private

 def parse(response)
   JSON.parse(response.body)["value"]["timeSeries"]
 end

end
