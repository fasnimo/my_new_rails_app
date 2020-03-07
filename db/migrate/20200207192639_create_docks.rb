class CreateDocks < ActiveRecord::Migration[6.0]
  def change
    create_table :docks do |t|
      t.integer :mission_id
      t.string :title
      t.string :item

      t.timestamps
    end
  end
end
