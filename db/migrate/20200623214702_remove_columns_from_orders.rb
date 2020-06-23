class RemoveColumnsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :status_id, :integer
    remove_column :orders, :title, :string
    remove_column :orders, :quantity, :integer
  end
end
