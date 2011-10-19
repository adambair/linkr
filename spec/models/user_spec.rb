require 'spec_helper'

describe User do
  before do
    @user = Factory(:user)
  end

  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:nickname) }

  context "Login finder:" do

    it "can find by nickname (login)" do
      User.by_login(@user.nickname).first.should == @user
    end

    it "can find by email (login)" do
      User.by_login(@user.email).first.should == @user
    end
  end
end
