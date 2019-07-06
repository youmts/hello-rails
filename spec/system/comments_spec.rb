require 'rails_helper'

RSpec.describe 'Comments', type: :system, js_headless: true do
  before do
    sign_in create(:user)
    @entry = create(:entry)
  end

  scenario 'Commentの追加が完了するとメールが送信され承認待ちのコメントが表示されること' do
    visit entry_path(@entry)

    fill_in '* New Comment', with: 'comment'
    expect(page).not_to have_content "承認待ち"

    expect {
      click_button 'Create Comment'
      expect(page).to have_content "承認待ち"
    }.to change(Comment, :count).by(1)

    # TODO: mail test

    expect(page).to have_current_path entry_path(@entry)
  end

  scenario 'Commentの承認が完了するとコメントが表示されること'
end