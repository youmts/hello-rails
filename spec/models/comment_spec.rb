require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @blog = Blog.create(title: "blog")
    @entry = @blog.entries.create(title: "entry")
    @comment = @entry.comments.build(body: "text", status: "unapproved")
  end

  it "beforeで生成済みのmodelは有効な状態であること" do
    expect(@comment.valid?).to be_truthy
  end

  it "bodyが空の場合は無効な状態であること" do
    @comment.body = ""
    expect(@comment.valid?).to be_falsey
  end

  it "statusがapprovedの場合は有効な状態であること" do
    @comment.status = "approved"
    expect(@comment.valid?).to be_truthy
  end

  it "statusがunapprovedの場合は有効な状態であること" do
    @comment.status = "unapproved"
    expect(@comment.valid?).to be_truthy
  end

  it "statusがその他の場合は無効な状態であること" do
    @comment.status = "other"
    expect(@comment.valid?).to be_falsey
  end
end
