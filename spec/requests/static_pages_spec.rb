require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'TrainingApp'" do
      visit root_path
      page.should have_content('Training App')
    end

    it "should have the base title" do
      visit root_path
      page.should have_content('Ruby on Rails Training')
    end

    it "should not have the custom title" do
      visit root_path
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do
    it "should have the header 'Help Page'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help Page')
      page.should have_selector('title', :text => 'Ruby on Rails Training | Help Page')
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit about_path
      page.should have_content('About Us')
    end

    it "should have the header 'About Us'" do
      visit about_path 
      page.should have_selector('h1', text: 'About Us')
    end
  end

  describe "Contact page" do
    it "should have the title 'Contact page'" do
      visit contact_path
      page.should have_selector('title', text: 'Contact page')
    end

    it "should have the header 'Contact us'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact us')
    end

    it "should have the form with text 'Contact form'" do
      visit contact_path
      page.should have_selector('form', text: 'Contact form')
    end
  end
end
