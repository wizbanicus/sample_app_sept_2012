require 'spec_helper'

describe ApplicationHelper do
	
	describe "full_title" do

		it "should include the page title" do
			full_title('foobar').should =~ /foobar/
		end

		it "should include the base title" do
			full_title('foobar').should =~ /^James awesome Ruby tutorial sample app/
		end

		it "should not include a bar on the home page" do
			full_title('').should_not =~ /\|/
		end

	end
end