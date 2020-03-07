class CreatePorts < ActiveRecord::Migration[6.0]
  def change
    create_table :ports do |t|
      t.string :title
      t.string :item

      t.timestamps
    end
  end
end
