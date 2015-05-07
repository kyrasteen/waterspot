require 'spec_helper'

describe "Geo Polygons" do
  it "formats polygon to geoJSON" do
    polygon = Polygon.create(shape:"{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Polygon\",\"coordinates\":[[[-104.227294921875,40.2208
                             2997283284],[-102.733154296875,39.884450178234395],[-103.985595703125,39.53793974517628],[-104.227294921875,40.2208299728328
                            ) ]]]}}" )
    expect(polygon)
  end
end
