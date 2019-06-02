require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is confirmed" do
    user = create(:user)
    expect(user.confirmed?).to be_truthy
  end
end
