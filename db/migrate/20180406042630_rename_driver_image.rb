class RenameDriverImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :drivers, :driver_img, :img
  end
end
