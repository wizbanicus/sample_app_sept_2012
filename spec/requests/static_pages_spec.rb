require 'spec_helper'

describe "Static Pages" do

  subject {page}

  describe "Home page" do 
    before { visit root_path }
    it {should have_selector('h1', text:'Sample App')} 
    it {should have_selector('title', text: full_title(''))}
    it {should_not have_selector('title', text: '| home')}
   end

  describe "Help page" do   
    before {visit help_path}
    it {should have_selector('h1', text: 'Help')}
    it {should have_selector('title', text: full_title('help'))}
  end

  describe "About page" do   
    before {visit about_path}
    it {should have_selector('h1', text: 'About Us') }
    it {should have_selector('title', text: full_title('About Us'))}
  end

  describe "Contact page" do   
    before {visit contact_path}
    it {should have_selector('h1', text: 'contact us')} 
    it {should have_selector('title', text: full_title('contact us'))}
  end

  it "should have the right lnks on the layout"  do
    visit root_path
    click_link "about"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('help')
    click_link "contact"
    page.should have_selector 'title', text: full_title('contact us')
    click_link "Home"
    click_link 'sign up'
    page.should have_selector 'title', text: full_title('signup')

  end


end
