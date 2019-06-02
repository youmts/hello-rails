require 'rails_helper'

RSpec.describe 'Blogs', type: :system do
  before do
    sign_in create(:user)
  end

  scenario 'Blogの新規作成時にtitleを入力しないとエラーになること' do
    visit new_blog_path

    fill_in 'Title', with: ''
    expect {
      click_button 'Create Blog'
    }.to change(Blog, :count).by(0)

    expect(page).to have_content "1 error prohibited this blog from being saved:"
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Blogの新規作成が完了するとBlog閲覧画面に遷移すること' do
    visit new_blog_path

    fill_in 'Title', with: 'title'
    expect {
      click_button 'Create Blog'
    }.to change(Blog, :count).by(1)

    expect(page).to have_current_path blog_path(Blog.last.id)
    expect(page).to have_content "Blog was successfully created."
  end
end