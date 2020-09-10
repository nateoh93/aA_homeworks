require 'rails_helper'

describe User do
  
  subject(:user) {
    User.new(
      email: "techno@io.com",
      password: "password")
  }

  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "#is_password?" do
    it "creates a password digest" do
      expect(user.password_digest).to_not be_nil
    end
  end

  describe "#reset_session_token!" do
    it "creates a new session token" do
      prev_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(prev_session_token)
    end
  end
  
  describe "::find_by_credentials" do
    before {user.save!}

    it "returns user if credentials are valid" do
      expect(User.find_by_credentials('techno@io.com', 'password')).to eq(user)
    end

    it "returns nil if credentials are not valid" do
      expect(User.find_by_credentials('', 'password')).to eq(nil)
    end
  end
end
