class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
