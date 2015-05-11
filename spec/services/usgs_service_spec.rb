require 'rails_helper'

describe UsgsService do
  it "return gauges for a given state" do
    service = UsgsService.new
    co_gauges = service.gauges("co")
    co_gauges.each do |gauge|
      expect(gauge["sourceInfo"]["siteName"].include?("CO"))
    end
  end
end
