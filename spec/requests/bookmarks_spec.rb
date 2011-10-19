require 'spec_helper'

feature "Bookmarks:" do
  background do
    @user = Factory(:user)
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
  end

  scenario "A user should be able to create a bookmark" do
    visit new_bookmark_path
    page.should have_content("Save a new bookmark")
    fill_in "Title", :with => "Proggit"
    fill_in "Url", :with => "http://reddit.com/r/programming"
    fill_in "Notes", :with => "The programming subreddit"
    click_button "Create Bookmark"
    page.should have_content("You saved a new bookmark!")
  end

  scenario "A user should be able to see their own bookmarks" do
    pending
  end

  scenario "A user should be able to see their own bookmarks" do
    pending
  end

  scenario "A user should be able to see everyone's bookmarks" do
    pending
  end

  scenario "A user should be able to see another user's bookmarks" do
    pending
  end

end
