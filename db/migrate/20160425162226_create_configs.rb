class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :name, unique: true, index: true
      t.jsonb :content, null: false, default: '{}'

      t.timestamps null: false
    end
    add_index :configs, :content, using: :gin
  end
end
