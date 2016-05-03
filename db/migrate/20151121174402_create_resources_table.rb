class CreateResourcesTable < ActiveRecord::Migration
  def change
    create_table :resources, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.citext :name, unique: true, null: false
    end
  end
end
