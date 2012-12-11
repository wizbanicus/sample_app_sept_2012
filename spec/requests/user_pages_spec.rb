require 'spec_helper'

describe "User Pages" do

	subject { page }

	describe "signup Page" do
		before { visit signup_path }
			it { should have_selector('h1',    text: 'Sign up') }
			it { should have_selector('title', text: full_title('signup')) }
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
			it { should have_selector('h1',    text: user.name) }
			it { should have_selector('title', text: user.name) }
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) {"Create my account"}

		describe "with invalid information" do
			before do
				fill_in "Name",         with: ""
				fill_in "Email",        with: "foobar@"
				fill_in "Password",     with: ""				
				fill_in "Confirmation", with: "foobarbaz"
				click_button submit
			end

			it "should display errors" do
				page.should have_selector('ul', text: 'Password')
				page.should have_selector('ul', text: 'Name')
				page.should have_selector('ul', text: 'Email')

			end

			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name",         with: "Foo Bar"
				fill_in "Email",        with: "foobar@baz.bz"
				fill_in "Password",     with: "foobarbaz"				
				fill_in "Confirmation", with: "foobarbaz"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			describe "after saving a user" do
				before { click_button submit }
				let(:user) { User.find_by_email("foobar@baz.bz") }
				it { should have_selector('title', text: user.name) }
				it { should have_selector('div.alert.alert-success', text: "Welcome") }
				it { should have_link('Sign out')}
			end
		end
	end
end
