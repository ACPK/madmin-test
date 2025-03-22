class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :content, null: true
      t.text :encrypted_user_id
      t.timestamps
    end
  end
end
