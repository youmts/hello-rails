# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
