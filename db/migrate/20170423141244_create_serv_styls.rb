class CreateServStyls < ActiveRecord::Migration
  def change
    create_table :serv_styls do |t|
      t.references :service, index: true, foreign_key: true
      t.references :stylist, index: true, foreign_key: true
      t.float :price

      t.timestamps null: false
    end
  end
end
