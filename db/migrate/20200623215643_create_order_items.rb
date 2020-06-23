class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :title
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :artwork, foreign_key: true
      t.references :status, foreign_key: true
    end
  end
end
