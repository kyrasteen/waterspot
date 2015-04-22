class ChangeLatToDecimal < ActiveRecord::Migration
  def change
    remove_column :spots, :lat
    remove_column :spots, :long
    add_column :spots, :lat, :decimal, {:precision=>10, :scale=>7}
    add_column :spots, :long, :decimal, {:precision=>10, :scale=>7}
  end
end
