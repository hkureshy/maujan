class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.integer :salon_id
      t.integer :branch_id
      t.integer :service_category_id
      t.integer :stylist_category_id
      t.string :name

      t.timestamps null: false
    end
  end
end
