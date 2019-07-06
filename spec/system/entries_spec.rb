require 'rails_helper'

RSpec.describe 'Entries', type: :system do
  before do
    sign_in create(:user)
  end

  scenario 'Entryの新規作成が完了するとEntry閲覧画面に遷移すること' do
    blog = create(:blog)

    visit new_blog_entry_path(blog)

    fill_in 'Title', with: 'title'
    expect {
      click_button 'Create Entry'
    }.to change(Entry, :count).by(1)

    expect(page).to have_current_path entry_path(Entry.last.id)
    expect(page).to have_content "Entry was successfully created."
  end

  scenario 'Entryの編集が完了するとEntry閲覧画面に遷移すること' do
    entry = create(:entry)

    old_title = entry.title
    new_title = entry.title + "!"

    visit edit_entry_path(entry)
    fill_in 'Title', with: new_title
    expect {
      click_button 'Update Entry'
    }.to change { Entry.find(entry.id).title }.from(old_title).to(new_title)

    expect(page).to have_current_path entry_path(entry)
    expect(page).to have_content "Entry was successfully updated."
  end

  scenario 'Entryの削除が完了するとBlog閲覧画面に遷移すること' do
    entry = create(:entry)

    visit blog_path(entry.blog)
    expect {
      delete_link = find("a[data-method=\"delete\"][href=\"#{entry_path(entry)}\"]")
      delete_link.click
    }.to change(Entry, :count).by(-1)

    expect(page).to have_current_path blog_path(entry.blog)
    expect(page).to have_content "Entry was successfully destroyed."
  end
end