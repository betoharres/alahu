class CreateUserCompanies < ActiveRecord::Migration
  def change
    create_table :users_companies, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user    , index: true    , foreign_key: true , type: :uuid
      t.references :company , index: true    , foreign_key: true , type: :uuid
      t.boolean :accepted   , default: true

      t.timestamps null: false
    end
  end
end
