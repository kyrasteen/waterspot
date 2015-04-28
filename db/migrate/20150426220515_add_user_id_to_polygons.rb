class AddUserIdToPolygons < ActiveRecord::Migration
  def change
    add_column :polygons, :user_id, :integer
  end
end
