class FormatPrice < ActiveRecord::Migration
  def change
    change_column :shoes, :price, :decimal, precision:10, scale: 2
  end
end
