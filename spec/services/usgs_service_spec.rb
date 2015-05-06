require 'rails_helper'

describe UsgsService do

  it "return gauges for a given state" do
    VCR.use_cassette("usgs_cassette") do
      service = UsgsService.new
      co_gauges = service.gauges("co")
      expect(co_gauges.first[1]['note'].first['value']).to eq("[co]")
    end
  end
end
