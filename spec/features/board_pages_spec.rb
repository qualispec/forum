require 'spec_helper'

describe "BoardPages" do
  before { 10.times { FactoryGirl.create(:board) } }

  subject { page }

  describe "Board index" do
    it "should have all board titles and bodies" do
      visit boards_path
      Board.all.each do |b|
        page.should have_content("#{b.title}")
        page.should have_content("#{b.body}")
      end
    end
  end

  describe "Board show page" do
    before { 20.times { Board.first.posts << FactoryGirl.create(:post) } }

    it "should have all the posts for that board" do
      visit board_path(Board.first)
      Post.all.each { |p| page.should have_content("#{p.title}") }
    end
  end
end