class GeoSpots

  RATING_COLORS = { "0" => "#e8f3fb", "1" => "#e8f3fc", "2" => "#d2e7f9",
                    "3" => "#bbdbf6", "4" => "#a5cff3", "5" => "#85beef",
                    "6" => "#6fb2ec", "7" => "#4fa1e8", "8" => "#3d97e6",
                    "9" => "#1973c2", "10" => "#135895"}

  def self.create(spots)
    spots.map do |spot|
      {
        type: "Feature",
        geometry: {
          type:        "Point",
          coordinates: [spot.long.to_f, spot.lat.to_f]
        },
        properties: {
          name:       spot.user.username,
          river_name: spot.name,
          date:       spot.formatted_date,
          avatar:     "#{spot.avatar}",
          rating:     spot.rating,
          "marker-color" => RATING_COLORS[spot.rating],
          "marker-symbol" => "",
          "marker-size" => "small",
        }
      }
    end
  end

end
