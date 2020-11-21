FactoryBot.define do
  factory :user do
    name { 'name' }
    email { 'email@example.com' }
    introduction { 'introduction' }
    password { 'password' }
  end
end