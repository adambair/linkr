require 'spec_helper'

feature "Dashboard:" do
  background do
    @user = Factory(:user)
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
  end

  scenario "Users should be have a dashboard" do
    visit dashboard_path
    page.should have_content("Your Bookmarks")
  end
end
