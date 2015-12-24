class CreateResourcesTable < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.citext :name, unique: true
    end
  end
end
