class ChangeVents < ActiveRecord::Migration[5.0]
  def change
    add_column :vents, :latitude, :decimal
    add_column :vents, :longitude, :decimal
    add_column :vents, :device_id, :string
  end
end
