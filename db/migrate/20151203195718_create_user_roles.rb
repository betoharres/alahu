class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :email, unique: true, null: false
      # t.references :user, index: true, foreign_key: true, type: :uuid
      t.references :role, index: true, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
