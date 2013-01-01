FactoryGirl.define do 
	factory :user do
	  sequence(:name) { |n| "Person #{n}"}
	  sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobarbaz"
		password_confirmation "foobarbaz"
		
	  factory :admin do
      admin true
	  end
	end
	
	factory :micropost do
	  content "Lorem Ipsum"
	  user
	end
	
end
