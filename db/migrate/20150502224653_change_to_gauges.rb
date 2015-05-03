class ChangeToGauges < ActiveRecord::Migration
  def change
    remove_column :gauges, :properties
  end
end
