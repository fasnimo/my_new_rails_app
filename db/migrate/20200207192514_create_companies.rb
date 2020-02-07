class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string, :name
      t.boolean :cargo_ship

      t.timestamps
    end
  end
end
