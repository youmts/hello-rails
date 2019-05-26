require 'rails_helper'

RSpec.describe Blog, type: :model do
  it "titleがあれば有効な状態であること" do
    blog = Blog.new(title: "title")
    expect(blog.valid?).to be_truthy
  end

  it "titleがなければ無効な状態であること" do
    blog = Blog.new(title: "")
    expect(blog.valid?).to be_falsey
  end
end
