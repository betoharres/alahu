FactoryGirl.define do
  factory :lamp_stat do
    sequence(:serial_number)
    date "2016-02-29 17:38:21"
    power 1
    current 1.5
    volt 1.5
    tCom 1.5
    tLed1 1.5
    tLed2 1.5
    sLum 1
    rssiDev 1
    lqiDev 1
    correlationDev 1
    rssi 1
    lqi 1
    correlation 1
    sentPkts 1
    rcvPkts 1
    lastReboot 1
    txPwr 1
    ctrlRestart 1
    vFirmware 1
    vCmd 1
    cksCfg 1
    appCksErr 1
    cmdNotImp 1
    online false
    communicating false
    sunrise "MyString"
    sunset "MyString"
  end
end
