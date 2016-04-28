class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, index: true, foreign_key: true, type: :uuid, null: false
      t.references :role, index: true, foreign_key: true, type: :uuid, null: false

      t.timestamps null: false
    end
  end
end
