class RemoveTypeOfFromGauge < ActiveRecord::Migration
  def change
    remove_column :gauges, :type_of
  end
end
