require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  let(:guest_user) { create(:guest_user) }

  describe 'ページタイトル' do
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

  describe '新規登録/ログインの動作' do
    it 'sign_up' do
      visit new_user_registration_path
      fill_in 'ユーザー名', with: 'テスター'
      fill_in 'メールアドレス', with: 'tester@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認用）', with: 'password'

      expect { click_button '新規登録' }.to change(User, :count).by(1)
      expect(current_path).to eq root_path
      expect(page).to_not have_content 'かんたんログイン'
      expect(page).to have_content '投稿する'
      expect(page).to have_content 'テスター'
    end

    it 'sign_in' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'

      expect(current_path).to eq root_path
      expect(page).to_not have_content 'かんたんログイン'
      expect(page).to have_content '投稿する'
      expect(page).to have_content user.name
    end
  end

  describe 'パスワード再設定の動作' do
    before do
      ActionMailer::Base.deliveries.clear
    end

    it 'reset_password' do
      visit new_user_password_path
      fill_in 'メールアドレス', with: user.email

      expect { click_button 'パスワードの再設定方法を送信する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'パスワードの再設定について数分以内にメールでご連絡いたします。'
    end

    it 'guest_reset_password' do
      visit new_user_password_path
      fill_in 'メールアドレス', with: guest_user.email

      expect { click_button 'パスワードの再設定方法を送信する' }.to change { ActionMailer::Base.deliveries.size }.by(0)
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content 'ゲストユーザーの変更はできません。'
    end
  end

  describe 'かんたんログインの動作' do
    it 'guest_sign_in' do
      visit root_path
      click_link 'かんたんログイン'

      expect(current_path).to eq root_path
      expect(page).to_not have_content 'かんたんログイン'
      expect(page).to have_content '投稿する'
      expect(page).to have_content 'ゲスト'
    end

    it 'guest_edit' do
      sign_in guest_user
      visit root_path
      find('.dropdown-toggle').click
      click_link '設定'

      fill_in 'ユーザー名', with: 'hogehoge'
      fill_in '現在のパスワード', with: guest_user.password
      click_button '更新する'

      expect(current_path).to eq root_path
      expect(page).to_not have_content 'hogehoge'
      expect(page).to have_content 'ゲスト'
    end
  end
end
