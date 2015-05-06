require 'spec_helper'

describe "Geo Spots" do
  it "formats spot to geoJSON" do
    user = User.create(username:"betty", password:"password", email:"betty@example.com")
    spot = Spot.create(lat:39.000, long:-82.5, user_id:user.id, rating:3)

    geospot = GeoSpots.create([spot])

    expect(geospot.first[:type]).to eq("Feature")
  end

  it "assigns the correct color" do
    user = User.create(username:"betty", password:"password", email:"betty@example.com")
    spot = Spot.create(lat:39.000, long:-82.5, user_id:user.id, rating:3)

    geospot = GeoSpots.create([spot])
    expect(geospot.first[:properties]['marker-color']).to eq('#bbdbf6')
  end
end
