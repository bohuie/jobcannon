require 'spec_helper'
include Warden::Test::Helpers

describe "edit_registration"do


	let(:user) { create_logged_in_user }
	
	describe "registration form test" do
		
		it "should have content fname" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('First name')
		end
			it "should have content lname" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Last name')
		end
		it "should have content Phone " do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Phone number')
		end
			it "should have content city" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('City')
		end
		it "should have content state" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('State/ province')
		end
			it "should have content Country" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Country')
		end
		it "should have content birthday" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Birthday')
		end
			it "should have content gender" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Gender')
		end
		it "should have content goals" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('Goals')
		end
			it "should have content i am" do 
			visit edit_user_registration_path(user)
			expect(page).to have_content('I am')
		end
	end



end