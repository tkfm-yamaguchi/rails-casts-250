# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    encrypted_password "MyString"
    password_salt "MyString"
  end
end
