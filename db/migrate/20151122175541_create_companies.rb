class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :subdomain

      t.timestamps null: false
    end
  end
end
