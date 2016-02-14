class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :name, unique: true, null: false

      t.timestamps null: false
    end
  end
end
