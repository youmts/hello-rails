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

  scenario 'Blogの編集が完了するとBlog閲覧画面に遷移すること' do
    blog = create(:blog)
    old_title = blog.title
    new_title = old_title + "!"

    visit edit_blog_path(blog)
    fill_in 'Title', with: new_title
    expect {
      click_button 'Update Blog'
    }.to change { Blog.find(blog.id).title }.from(old_title).to(new_title)

    expect(page).to have_current_path blog_path(Blog.last.id)
    expect(page).to have_content "Blog was successfully updated."
  end

  scenario 'Blogの削除が完了するとBlog閲覧画面に遷移すること' do
    blog = create(:blog)

    visit blogs_path
    expect {
      delete_link = find("a[data-method=\"delete\"][href=\"#{blog_path(blog)}\"]")
      delete_link.click
    }.to change(Blog, :count).by(-1)

    expect(page).to have_current_path blogs_path
    expect(page).to have_content "Blog was successfully destroyed."
  end
end