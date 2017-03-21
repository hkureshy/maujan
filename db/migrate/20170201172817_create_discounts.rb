class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :salon_id
      t.integer :branch_id
      t.integer :service_id
      t.integer :service_category_id
      t.float :discount_percent
      t.date :discount_date
      t.time :discount_time

      t.timestamps null: false
    end
  end
end
