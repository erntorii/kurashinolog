require 'rails_helper'

RSpec.describe 'Logs', type: :system do
  it 'get home' do
    visit root_path
    expect(page).to have_title '暮らしのログ'
  end

  it 'get about' do
    visit about_path
    expect(page).to have_title 'about - 暮らしのログ'
  end
end
