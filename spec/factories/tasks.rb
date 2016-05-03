FactoryGirl.define do
  factory :task do
    execute_at "2016-05-02 23:20:02"
    code 1
    state "MyString"
    description "MyString"
    node nil
    attachable nil
  end
end
