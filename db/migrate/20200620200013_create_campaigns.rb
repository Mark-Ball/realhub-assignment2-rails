class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.integer :unit_number
      t.integer :street_number
      t.string :street_name
      t.string :suburb_name
    end
  end
end
