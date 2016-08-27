class CreateVents < ActiveRecord::Migration[5.0]
  def change
    create_table :vents do |t|
      t.text :content

      t.timestamps
    end
  end
end
