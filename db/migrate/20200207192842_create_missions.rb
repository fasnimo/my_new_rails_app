class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.integer :company_id
      t.integer :port_id
      t.string :ship
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
