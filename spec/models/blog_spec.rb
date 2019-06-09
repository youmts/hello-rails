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
  describe "factory" do
    it "buildが有効であること" do
      expect(build(:blog).valid?).to be_truthy
    end

    it "createができること" do
      expect(create(:blog).persisted?).to be_truthy
    end

    it "entryを複数持つcreateができること" do
      blog = create(:blog, :has_entries)
      expect(blog.valid?).to be_truthy
      expect(blog.entries.count).to be > 0
    end
  end

  it "titleがなければ無効な状態であること" do
    blog = build(:blog, title: "")
    expect(blog.valid?).to be_falsey
  end
end
