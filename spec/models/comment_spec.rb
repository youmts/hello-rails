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
    it { should enumerize(:status)
                    .in(:unapproved, :approved)
                    .with_predicates(true)
    }

    it "approveするとapprovedに変わること" do
      comment = build(:comment, status: :unapproved)

      expect { comment.approve }.to change { comment.approved? }.from(false).to(true)
    end
  end
end
