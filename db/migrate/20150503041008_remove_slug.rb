class RemoveSlug < ActiveRecord::Migration
  def change
    remove_column :users, :slug
  end
end
