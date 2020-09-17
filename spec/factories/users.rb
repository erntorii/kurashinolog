FactoryBot.define do
  factory :user do
    name { 'テスター' }
    email { 'tester@example.com' }
    password { 'password' }
  end
end
