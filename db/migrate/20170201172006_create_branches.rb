class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.integer :salon_id
      t.string :name
      t.string :city
      t.string :area

      t.timestamps null: false
    end
  end
end
