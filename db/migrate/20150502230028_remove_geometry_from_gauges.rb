class RemoveGeometryFromGauges < ActiveRecord::Migration
  def change
    remove_column :gauges, :geometry
    add_column :gauges, :lat, :float
    add_column :gauges, :long, :float
  end
end
