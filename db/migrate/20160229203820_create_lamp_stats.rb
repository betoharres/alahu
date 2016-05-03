class CreateLampStats < ActiveRecord::Migration
  def change
    create_table :lamp_stats, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :serial_number,  limit: 8, index: true, null: false, unique: true
      t.integer :sentPkts,       limit: 8
      t.integer :rcvPkts,        limit: 8
      t.integer :lastReboot,     limit: 8
      t.integer :ctrlRestart,    limit: 8
      t.integer :rssiDev,        limit: 2
      t.integer :lqiDev,         limit: 2
      t.integer :correlationDev, limit: 2
      t.integer :rssi,           limit: 2
      t.integer :lqi,            limit: 2
      t.integer :correlation,    limit: 2
      t.integer :txPwr,          limit: 2
      t.integer :vFirmware,      limit: 2
      t.integer :power,          limit: 2
      t.integer :sLum
      t.integer :vCmd
      t.integer :cksCfg
      t.integer :appCksErr
      t.integer :cmdNotImp
      t.float :current
      t.float :volt
      t.float :tCom
      t.float :tLed1
      t.float :tLed2
      t.boolean :online
      t.boolean :communicating
      t.datetime :date
      t.string :sunrise,         limit: 25
      t.string :sunset,          limit: 25

      t.timestamps null: false
    end
  end
end
