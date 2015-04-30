class UsgsService
  attr_reader :connection

 def initialize
   @connection = Faraday.new(url: "http://waterservices.usgs.gov/nwis/dv/?format=json")
 end

 #try with colorado first
 def gauges
   parse(connection.get("&parameterCd=00060&siteType=ST&siteStatus=active&stateCd=co"))
 end

 private

 def parse(response)
   JSON.parse(response.body)
 end

end
