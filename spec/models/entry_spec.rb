# == Schema Information
#
# Table name: entries
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer
#

require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "factory" do
    it "buildが有効であること" do
      expect(build(:entry).valid?).to be_truthy
    end

    it "createができること" do
      expect(create(:entry).persisted?).to be_truthy
    end

    it "commentを複数持つcreateができること" do
      expect(create(:entry, :has_comments).persisted?).to be_truthy
    end
  end

  it "attachmentを持てること" do
    entry = create(:entry)
    entry.attachments.create(attachment: "attachment")
  end
end
