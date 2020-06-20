class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :title, :string
    add_column :orders, :quantity, :integer
  end
end
