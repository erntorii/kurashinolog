require 'rails_helper'

RSpec.describe "Users", type: :system do
  it 'get sign_up' do
    visit new_user_registration_path
    expect(page).to have_title '新規登録 - 暮らしのログ'
  end

  it 'get sign_in' do
    visit new_user_session_path
    expect(page).to have_title 'ログイン - 暮らしのログ'
  end

  it 'get password/new' do
    visit new_user_password_path
    expect(page).to have_title 'パスワードの再設定 - 暮らしのログ'
  end
end
