class AddPassengerImage < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :img, :string
  end
end
