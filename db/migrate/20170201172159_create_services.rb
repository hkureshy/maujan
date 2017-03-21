class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :salon_id
      t.integer :branch_id
      t.integer :service_category_id
      t.string :service_name
      t.float :price
      t.float :discount, default: 0.0

      t.timestamps null: false
    end
  end
end
