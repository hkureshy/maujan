class AddAvatarToSalons < ActiveRecord::Migration
  def change
    add_column :salons, :salon_img, :string
  end
end
