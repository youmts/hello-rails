require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is confirmed" do
    user = create(:user)
    expect(user.confirmed?).to be_truthy
  end

  describe "User.find_for_google" do
    context "already exists" do
      it "returns the user" do
        user = create(:user)
        auth = OmniAuth::AuthHash.new(
          {
              info: {
                  email: user.email
              },
              uid: "uid",
              credentials: {
                  token: "token"
              }
          }
        )

        expect {
          expect(User.find_for_google(auth)).to eq user
        }.to change{ User.count }.by(0)
      end
    end

    context "not exists" do
      it "returns new user" do
        auth = OmniAuth::AuthHash.new(
            {
                info: {
                    email: "new@example.com"
                },
                uid: "uid",
                credentials: {
                    token: "token"
                }
            }
        )

        expect {
          expect(User.find_for_google(auth).email).to eq auth.info.email
        }.to change{ User.count }.by(1)
      end
    end
  end
end
