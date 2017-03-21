class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :salon_name
      t.string :salon_email
      t.string :owner_email

      t.timestamps null: false
    end
  end
end
