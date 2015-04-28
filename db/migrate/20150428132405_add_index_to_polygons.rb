class AddIndexToPolygons < ActiveRecord::Migration
  def change
    add_index :polygons, :user_id
    add_index :spots, :user_id
  end
end
