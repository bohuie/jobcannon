class CommunicationSkill < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user

  private
    def do_setID    
      newID = self.id
      self.update_attributes(:communication_skills_id => newID)
    end
end