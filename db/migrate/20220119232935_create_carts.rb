class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :identifier, null: false, index: true
      t.timestamps
    end

    create_table :carts_products do |t|
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity, null: false, default: 0
    end
  end
end
