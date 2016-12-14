class ChangeEventUserReference < ActiveRecord::Migration
  def change
    remove_index :events, :host_id
    remove_column :events, :host_id
    add_reference :events, :users, index:true
  end
end
