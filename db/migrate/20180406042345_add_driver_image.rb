class AddDriverImage < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :driver_img, :string
  end
end
