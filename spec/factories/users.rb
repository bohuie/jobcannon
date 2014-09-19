FactoryGirl.define do
  factory :user do
    username "testname"
    fname	"test"
    lname	"test"
    email "test1@email.com"
    password "foobarfoobar"
    password_confirmation "foobarfoobar"    
    city		"test" 
    province    "test"
   	gender		"test"    
    admin       false
    employer    false
    employee    false
    user_id     1

    
    trait :employee do    	
    	admin       false
        employer    false
        employee    true
    end


    trait :employer do
    	company_name "test"
    	company_address "test"
    	field	"test"
        admin       false
        employer    true
        employee    false
    end

    trait :admin do
    	admin       true
        employer    false
        employee    false
    end
    
  end
end