FactoryBot.define do
  factory :user do
    name { 'テスター' }
    email { 'tester@example.com' }
    password { 'password' }
  end

  factory :alice, class: User do
    name { 'アリス' }
    email { 'alice@example.com' }
    password { 'password' }
  end

  factory :guest_user, class: User do
    name { 'ゲスト' }
    email { 'guest@example.com' }
    password { 'password' }
  end
end
