class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :category
      t.integer :salon_id
      t.integer :branch_id
      t.timestamps null: false
    end
  end
end
