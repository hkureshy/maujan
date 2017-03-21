class CreateServiceStylists < ActiveRecord::Migration
  def change
    create_table :service_stylists do |t|
      t.integer :service_category_id
      t.integer :stylist_category_id

      t.timestamps null: false
    end
  end
end
