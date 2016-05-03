class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.citext :subdomain, null: false, unique: true
      t.boolean :public  , default: true

      t.timestamps null: false
    end
  end
end
