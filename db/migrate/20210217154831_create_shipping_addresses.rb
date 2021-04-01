class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,  default: "",  null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, default: "",  null: false
      t.string :address, default: "",  null: false
      t.string :phone_number, default: "",  null: false
      t.string :building, default: ""
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
