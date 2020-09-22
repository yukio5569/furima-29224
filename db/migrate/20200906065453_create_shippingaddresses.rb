class CreateShippingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddresses do |t|
      t.integer :buyer_id,       foreign_key: true
      t.string  :postal_code,    null: false, default:""
      t.integer :prefecture_id,  null: false
      t.string  :city,           null: false, default:""
      t.string  :address,        null: false, default:""
      t.string  :building_name,               default:""
      t.string  :phone_number,   null: false, default:""
      t.timestamps
    end
  end
end


