class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,         foreign_key: true
      t.string :name,             null: false, default: ""
      t.text :explanation,        null: false
      t.integer :price,           null: false
      t.integer :category_id,     null: false
      t.integer :status_id,       null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefectres_id,   null: false
      t.integer :days_id,         null: false
      t.timestamps
    end
  end
end
