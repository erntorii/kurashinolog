require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  before do
    ActionMailer::Base.deliveries.clear
  end

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

  it 'sign_up' do
    visit new_user_registration_path
    fill_in 'ユーザー名', with: 'テスター'
    fill_in 'メールアドレス', with: 'tester@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'

    expect { click_button '新規登録' }.to change(User, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to_not have_content 'かんたんログイン'
  end

  it 'sign_in' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect(current_path).to eq root_path
    expect(page).to_not have_content 'かんたんログイン'
  end

  it 'reset_password' do
    visit new_user_password_path
    fill_in 'メールアドレス', with: user.email
    expect { click_button 'パスワードの再設定方法を送信する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
