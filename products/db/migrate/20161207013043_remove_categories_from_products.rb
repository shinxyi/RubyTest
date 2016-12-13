class RemoveCategoriesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :categories_id, :integer
  end
end
