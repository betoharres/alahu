class CreateFirmwares < ActiveRecord::Migration
  def change
    create_table :firmwares do |t|
      t.string :name
      t.string :path

      t.timestamps null: false
    end
  end
end
