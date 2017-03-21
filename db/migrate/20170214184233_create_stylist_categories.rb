class CreateStylistCategories < ActiveRecord::Migration
  def change
    create_table :stylist_categories do |t|
      t.integer :salon_id
      t.integer :branch_id
      t.integer :service_category_id
      t.string :category

      t.timestamps null: false
    end
  end
end
