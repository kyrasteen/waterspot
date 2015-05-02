class ChangeTypeToTypeOf < ActiveRecord::Migration
  def change
    remove_column :gauges, :type
    add_column :gauges, :type_of, :string
  end
end
