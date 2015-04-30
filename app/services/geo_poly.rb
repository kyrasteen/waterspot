class GeoPoly

  def self.create(polygons)
    polygons.map do |poly|
      {
        type: 'Feature',
        geometry: {
          type: 'Polygon',
          coordinates: JSON.parse(poly.shape)["geometry"]["coordinates"]
        },
        properties: {
          user_id: poly.user_id,
        }
      }
    end
  end

end
