class AddCategoryReferencesToProducts2 < ActiveRecord::Migration
  def change
    add_reference :products, :category, index:true
    remove_index :products, :categories_id
    remove_column :products, :categories_id, :integer
  end
end
