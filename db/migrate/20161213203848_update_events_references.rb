class UpdateEventsReferences < ActiveRecord::Migration
  def change
    remove_index :events, :users_id
    remove_column :events, :users_id
    add_reference :events, :user, index:true

  end
end
