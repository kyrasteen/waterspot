class AddStateToGauges < ActiveRecord::Migration
  def change
    add_column :gauges, :state, :string
  end
end
