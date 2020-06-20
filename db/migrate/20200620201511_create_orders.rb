class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :agency, foreign_key: true
      t.references :status, foreign_key: true
      t.references :campaign, foreign_key: true
    end
  end
end
