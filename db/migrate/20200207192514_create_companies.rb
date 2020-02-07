class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ship_name
      t.string :password_digest

      t.timestamps
    end
  end
end
