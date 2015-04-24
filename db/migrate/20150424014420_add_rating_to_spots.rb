class AddRatingToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :rating, :string
  end
end
