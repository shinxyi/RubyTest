class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :city
      t.string :state
      t.references :host, index: true

      t.timestamps
    end
  end
end
