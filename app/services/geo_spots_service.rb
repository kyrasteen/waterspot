class GeoSpots

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def create(spots)
  spots.map do |spot|
    binding.pry
    color = spot_color(spot.user)
      {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [spot.long.to_f, spot.lat.to_f]
        },
        properties: {
          name:   spot.user.username,
          date:   spot.formatted_date,
          avatar: spot.avatar_url,
          rating: spot.rating,
          "marker-color" => color,
          "marker-symbol" => "",
          "marker-size" => "small"
        }
      }
    end
  end

  private

  RATING_COLORS = { "1" => "#e8f3fc", "2" => "#d2e7f9", "3" => "#bbdbf6",
                    "4" => "#a5cff3", "5" => "#85beef", "6" => "#6fb2ec",
                    "7" => "#4fa1e8", "8" => "#3d97e6", "9" => "#1973c2",
                    "10" => "#135895"}

  def spot_color(user)
    user == current_user ? "#00a865" : RATING_COLORS[spot.rating]
  end

end
