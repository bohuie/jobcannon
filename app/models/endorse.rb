class Endorse < ActiveRecord::Base
 	after_create :do_setID
 	
  private
    def do_setID    
      newID = self.id
      self.update_attributes(:endorse_id => newID)
    end
end