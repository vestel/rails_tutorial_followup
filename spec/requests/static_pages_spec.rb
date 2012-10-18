require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
    it "should have the content 'TrainingApp'" do
      page.should have_content('Training App')
    end

    it { should have_selector('h1', text: 'Training App') }

    it { should_not have_selector('title', text: full_title('| Home')) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end

  end

  describe "Help page" do
    before { visit help_path }
    it {
      should have_selector('h1', text: 'Help Page')
      should have_selector('title', text: full_title('Help Page'))
    }
  end

  describe "About page" do
    before { visit about_path }
    it "should have the content 'About us'" do
      page.should have_content('About Us')
    end

    it "should have the header 'About Us'" do
      page.should have_selector('h1', text: 'About Us')
    end
  end

  describe "Contact page" do
    before { visit contact_path }
    it "should have the title 'Contact page'" do
      page.should have_selector('title', text: 'Contact page')
    end

    it "should have the header 'Contact us'" do
      page.should have_selector('h1', text: 'Contact us')
    end

    it "should have the form with text 'Contact form'" do
      page.should have_selector('form', text: 'Contact form')
    end
  end
end
