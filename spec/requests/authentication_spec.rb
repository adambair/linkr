require 'spec_helper'

feature "Signing Up:" do
  scenario "The homepage should have a signup link" do
    visit root_path
    page.should have_content("signup")
  end

  scenario "Allows the creatation of new accounts" do
    visit signup_path
    fill_in 'Nickname', :with => "jack"
    fill_in 'Email', :with => "jack@example.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign-up with Linkr"
    page.should have_content("successfully")
  end

  scenario "Does not allow account creation without required information" do
    visit signup_path
    click_button "Sign-up with Linkr"
    page.should have_content("Form is invalid")
  end

  scenario "Has a login link for people who already have accounts" do
    visit signup_path
    page.should have_content("Already a member?")
    page.should have_content("Login now!")
  end
end

feature "Logging In:" do
  background do
    @user = Factory(:user)
  end

  scenario "The homepage should have a login link" do
    visit root_path
    page.should have_content("login")
  end

  scenario "Allows a user to login using their email and password" do
    visit login_path
    fill_in "Nickname or email address", :with => @user.email
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
    page.should have_content("successfully")
  end

  scenario "Allows a user to login using their nickname and password" do
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
    page.should have_content("successfully")
  end

  scenario "Does not authenticate a user with invalid credentials" do
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "wrong-password"
    click_button "Login to Linkr"
    page.should have_content("Invalid login or password")
  end

  scenario "Has a signup link for people who do not have accounts" do
    visit login_path
    page.should have_content("Not a member?")
    page.should have_content("Sign-up now!")
  end
end

feature "Logging Out:" do
  background do
    @user = Factory(:user)
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
  end

  scenario "Authenticated users should see a logout link" do
    page.should have_content("logout")
  end

  scenario "Authenticated users should be able to log out" do
    click_link("logout")
    page.should have_content("Logged out sucessfully")
    page.should have_content("login")
  end
end
