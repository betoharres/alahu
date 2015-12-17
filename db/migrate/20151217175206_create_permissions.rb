class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :ability, limit: 2
      t.references :resourceable, polymorphic: true, index: true, type: :uuid
      t.references :role, index: true, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
