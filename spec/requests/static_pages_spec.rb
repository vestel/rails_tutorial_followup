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
      page.should have_content('Help Page')
    end
  end
end
