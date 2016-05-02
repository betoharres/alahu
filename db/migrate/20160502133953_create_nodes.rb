class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :name, unique: true, null: false
      t.st_point :location, geographic: true, has_z: true

      t.timestamps null: false
    end
  end
end
