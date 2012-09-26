require 'spec_helper'

describe "Static Pages" do

  describe "Home page" do   
    it "Should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text =>'Sample App')
    end
    it "Should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', 
           :text =>'James awesome Ruby tutorial sample app')
    end
    it "Should not have a custom title" do
      visit '/static_pages/home'
      page.should_not have_selector('title',
           :text =>'| home')
    end
   end

  describe "Help page" do   
    it "Should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    it "Should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', 
           :text =>'James awesome Ruby tutorial sample app | help')
    end
  end
  describe "About page" do   
    it "Should have the content 'About US'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us') 
    end
    it "Should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', 
           :text =>'James awesome Ruby tutorial sample app | About Us')
    end
  end
    describe "Contact page" do   
    it "Should have the content 'contact us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'contact us') 
    end
    it "Should have the right title" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
           :text =>'James awesome Ruby tutorial sample app | contact us')
    end
  end
end
