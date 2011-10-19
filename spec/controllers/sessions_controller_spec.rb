require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "Create" do
    before do
      @user = Factory(:user)
    end

    it "allows a user to login via nickname" do
      post :create, :login => @user.nickname, :password => 'password'
      response.should redirect_to(dashboard_path)
    end

    it "allows a user to login via email" do
      post :create, :login => @user.email, :password => 'password'
      response.should redirect_to(dashboard_path)
    end
  end

  describe "Destroy" do
    before do
      @user = Factory(:user)
      post :create, :login => @user.nickname, :password => 'password'
    end

    it "allows a user to logout" do
      post :destroy
      session[:user_id].should be_nil
    end
  end
end
