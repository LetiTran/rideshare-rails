class AddingCarAttr < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :car, :string
  end
end
