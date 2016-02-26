class CreateGateways < ActiveRecord::Migration
  def change
    create_table :gateways, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.boolean :authorized, default: false

      t.timestamps null: false
    end
  end
end
