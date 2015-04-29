class GeoSpots

  RATING_COLORS = { "1" => "#e8f3fc", "2" => "#d2e7f9", "3" => "#bbdbf6",
                    "4" => "#a5cff3", "5" => "#85beef", "6" => "#6fb2ec",
                    "7" => "#4fa1e8", "8" => "#3d97e6", "9" => "#1973c2",
                    "10" => "#135895"}

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
          avatar: spot.avatar_url,
          rating: spot.rating,
          :'marker-color' => RATING_COLORS[spot.rating],
          :'marker-symbol' => '',
          :'marker-size' => 'small'
        }
      }
    end
   geospots
  end

end
