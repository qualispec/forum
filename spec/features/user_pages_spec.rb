require 'spec_helper'

describe "UserPages" do
  def fill_form(user, signup=false)
    fill_in 'Username', with: "User_#{user}"
    fill_in 'Email', with: "User_#{user}@gmail.com" if signup
    fill_in 'Password', with: "asdfasdf"
    fill_in 'Confirmation', with: "asdfasdf" if signup
  end

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it "should create a user" do
      fill_form(1, true)

      expect { click_button 'Create' }.to change(User, :count).by(1)
    end

  end



end
