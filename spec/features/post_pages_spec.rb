require 'spec_helper'

describe "PostPages" do
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

  def fill_post_create
    fill_in 'Title', with: "Title_1"
    fill_in 'Body', with: "Body_1"
  end

  subject { page }

  before { FactoryGirl.create(:board); create_user(1) }

  describe "auth for new posts" do
    it "should require logging in to create posts" do
      visit new_board_post_path(Board.first)
      page.should have_content("Login")
    end

    it "lets logged in users create posts" do
      login_user(1)
      visit new_board_post_path(Board.first)
      page.should have_content("New Post")
    end
  end

  describe "making posts" do
    before { login_user(1); visit new_board_post_path(Board.first) }

    it "creates a post" do
      fill_post_create
      expect do
        click_button "Create"
      end.to change(Post, :count).by(1)
    end
  end





end
