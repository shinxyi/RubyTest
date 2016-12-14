class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :user, index: true
      t.references :associate, index: true
      t.boolean :accepted_invite

      t.timestamps
    end
  end
end
