class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :code, limit: 2, null: false
      t.citext :name, unique: true, index: true, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
