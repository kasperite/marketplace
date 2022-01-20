class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :discount_rate # percentage
      t.integer :threshold # cents

      t.timestamps
    end
  end
end
