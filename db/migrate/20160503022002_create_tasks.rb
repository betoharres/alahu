class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.datetime :execute_at, null: false
      t.integer :code, limit: 2
      t.integer :status, default: 0
      t.string :description
      t.references :node, index: true, foreign_key: true, type: :uuid
      t.references :attachable, polymorphic: true, index: true, type: :uuid

      t.timestamps null: false
    end
  end
end
