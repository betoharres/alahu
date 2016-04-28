class CreateGatewayRoles < ActiveRecord::Migration
  def change
    create_table :gateway_roles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :gateway, index: true, foreign_key: true, null: false, type: :uuid
      t.references :role   , index: true, foreign_key: true, null: false, type: :uuid

      t.timestamps null: false
    end
  end
end
