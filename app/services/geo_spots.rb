class GeoSpots

  def self.create(spots)
   geospots = spots.map do |spot|
      {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [spot.long.to_f, spot.lat.to_f]
        },
        properties: {
          name:   spot.user.username,
          date:   spot.formatted_date,
          rating: spot.rating,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'small'
        }
      }
    end
   geospots
  end

end
