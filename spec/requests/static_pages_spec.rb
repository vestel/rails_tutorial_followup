require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'TrainingApp'" do
      visit '/static_pages/home'
      page.should have_content('TrainingApp')
    end
  end

  describe "Help page" do

    it "should have the header 'Help Page'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help Page')
      page.should have_selector('title', :text => 'Ruby on Rails Tutorial | Help Page')
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

  end

end
