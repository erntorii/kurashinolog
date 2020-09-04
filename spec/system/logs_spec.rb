require 'rails_helper'

RSpec.describe 'Logs', type: :system do
  it 'get home' do
    visit root_path
    expect(page).to have_title 'index - 暮らしのログ'
  end

  it 'get about' do
    visit root_path
    expect(page).to have_title 'index - 暮らしのログ'
  end
end
