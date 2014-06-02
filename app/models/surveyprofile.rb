class Surveyprofile < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:survey_id => newID)


    end
end