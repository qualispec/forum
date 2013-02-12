require 'spec_helper'

describe "SessionsPages" do
  def fill_form(user, signup=false)
    fill_in 'Username', with: "User_#{user}"
    fill_in 'Email', with: "User_#{user}@gmail.com" if signup
    fill_in 'Password', with: "asdfasdf"
    fill_in 'Confirmation', with: "asdfasdf" if signup
  end

  def create_user(user)
    visit signup_path
    fill_form(user, true)
    click_button 'Create'
  end

  def login_user(user)
    visit login_path
    fill_form(user)
    click_button 'Log'
  end

  subject { page }

  describe "login/logout" do
    before { create_user(1); login_user(1) }

    it "logs in a user" do
      page.should have_content("User_1")
      page.should have_content("Boards")
      page.should have_content("Logout")
    end

    it "redirects if already logged in" do
      visit login_path
      page.should have_content("Boards")
      page.should have_content("Logout")
      page.should_not have_content("Login")
    end

    it "logs out a user" do
      click_link "Logout"
      page.should have_content("Login")
      page.should_not have_content("Logout")
    end
  end

end
