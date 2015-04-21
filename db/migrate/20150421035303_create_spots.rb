class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.string :lat
      t.string :long
      t.string :avatar

      t.timestamps null: false
    end
  end
end
