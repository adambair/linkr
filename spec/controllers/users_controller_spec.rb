require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "Create" do
    it "creates a user when given valid attributes" do
      valid_attributes = Factory.attributes_for(:user)
      lambda { 
        post :create, :user => valid_attributes 
      }.should change(User, :count).by(1)
    end

    it "redirects on successful creation" do
      valid_attributes = Factory.attributes_for(:user)
      post :create, :user => valid_attributes 
      response.should redirect_to(login_path)
    end

    it "does not create a user when given invalid attributes" do
      invalid_attributes = {}
      lambda { 
        post :create, :user => invalid_attributes 
      }.should_not change(User, :count).by(1)
    end

    it "does not redirect on failed creation" do
      invalid_attributes = {}
      post :create, :user => invalid_attributes 
      response.should_not redirect_to(root_path)
    end
  end

end
