class Surveyprofile < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user

 	# the below commented out lines validate the birthday correctly 
 	# but they do not work with the javascript. A message still apears saying
 	# data was saved, even though no data was

 	#validates_inclusion_of :birthday, in: Date.civil(1950, 1, 1)..Date.today-14.years,
   	#	message: "Must be between 1950 and 2000 and now"

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:survey_id => newID)


    end
end