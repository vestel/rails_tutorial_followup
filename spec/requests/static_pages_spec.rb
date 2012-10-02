require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'TrainingApp'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_content('Ruby on Rails Training')
    end

    it "should not have the custom title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do

    it "should have the header 'Help Page'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help Page')
      page.should have_selector('title', :text => 'Ruby on Rails Training | Help Page')
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the header 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
  end

  describe "Contact page" do
    it "should have the title 'Contact page'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => 'Contact page')
    end

    it "should have the header 'Contact us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact us')
    end

    it "should have the form with text 'Contact form'" do
      visit '/static_pages/contact'
      page.should have_selector('form', :text => 'Contact form')
    end
  end
end
