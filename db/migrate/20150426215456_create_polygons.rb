class CreatePolygons < ActiveRecord::Migration
  def change
    create_table :polygons do |t|
      t.text :shape
      t.timestamps null: false
    end
  end
end
