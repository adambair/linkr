require 'spec_helper'

feature "Navigation Auth'd:" do
  background do
    @user = Factory(:user)
    visit login_path
    fill_in "Nickname or email address", :with => @user.nickname
    fill_in "Password", :with => "password"
    click_button "Login to Linkr"
    visit dashboard_path
  end

  scenario "dashboard / personal bookmarks" do
    within('nav#site') { click_link('Bookmarks') }
    find('#main').should have_content('Your Bookmarks')
  end

  scenario "everyone's bookmarks" do
    pending
    within('nav#site') { click_link('Everyone') }
    find('#main').should have_content("Everyone's Bookmarks")
  end

  scenario "public profile" do
    within('nav#profile') { click_link(@user.nickname) }
    find('#main').should have_content(@user.nickname + "'s Bookmarks")
  end

  scenario "help" do
    within('nav#profile') { click_link('help') }
    find('#main').should have_content("Help")
  end

  scenario "header link" do
    within('header') { click_link('Linkr') }
    find('#main').should have_content('Your Bookmarks')
  end
end

feature "Navigation UnAuth'd:" do
  background do
    visit logout_path
  end

  scenario "only has login/logout" do
    within('header') {
      find('nav#profile').should have_content('login')
      find('nav#profile').should have_content('signup')
    }
  end

  scenario "does not have standard navigation" do
    within('header') {
      find('nav#site').should_not have_content('Bookmarks')
      find('nav#site').should_not have_content('Everyone')
    }
  end
end
