class WordProcessingFluentcy < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user

  private
    def do_setID    
      newID = self.id
      self.update_attributes(:word_fluentcy_id => newID)
    end
end