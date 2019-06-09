# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  status     :string(255)      default("unapproved"), not null
#  entry_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "factory" do
    it "buildが有効であること" do
      expect(build(:comment).valid?).to be_truthy
    end

    it "createができること" do
      expect(create(:comment).persisted?).to be_truthy
    end
  end

  it "bodyが空の場合は無効な状態であること" do
    comment = build(:comment, body: "")
    expect(comment.valid?).to be_falsey
  end

  describe "status" do
    it "statusがapprovedの場合は有効な状態であること" do
      comment = build(:comment, status: "approved")
      expect(comment.valid?).to be_truthy
    end

    it "statusがunapprovedの場合は有効な状態であること" do
      comment = build(:comment, status: "unapproved")
      expect(comment.valid?).to be_truthy
    end

    it "statusがその他の場合は無効な状態であること" do
      comment = build(:comment, status: "other")
      expect(comment.valid?).to be_falsey
    end

    it "approveするとapprovedに変わること" do
      comment = build(:comment, status: "unapproved")

      expect { comment.approve }.to change { comment.approved? }.from(false).to(true)
    end
  end
end
