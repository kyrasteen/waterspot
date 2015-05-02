class CreateGauges < ActiveRecord::Migration
  def up
    enable_extension :hstore
    create_table :gauges do |t|
      t.string :type
      t.string :name
      t.hstore :geometry
      t.hstore :properties
      t.string :value

      t.timestamps null: false
    end
  end

  def down
    disable_extension :hstore
  end
end
