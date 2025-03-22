class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :website_url
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
