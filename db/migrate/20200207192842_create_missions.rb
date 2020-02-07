class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.integer, :company_id
      t.integer, :dock_id
      t.string :ship_name

      t.timestamps
    end
  end
end
