class CreateFirmwares < ActiveRecord::Migration
  def change
    create_table :firmwares, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :name, null: false, unique: true, index: true
      t.citext :path, null: false, unique: true, index: true

      t.timestamps null: false
    end
  end
end
