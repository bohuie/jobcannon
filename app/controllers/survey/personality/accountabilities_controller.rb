class Survey::Personality::AccountabilitiesController < ApplicationController

def update
	
	@user = current_user
	@com = Accountability.find_by(:user_id=>@user.user_id)
	@com.update_attributes(accountability_params)	
	personality_progression()
	respond_to do |f|
		f.js
	end	
end

	private

	def accountability_params
		params.require(:accountability).permit(:q1,:q2,:q3,:q4,:q5,:q6, :user_id)
	end

	def personality_progression
    @personality_progress = -15
    @total_personality_questions = 42

    @DBprogress = Progress.find_by(:user_id=>@user.user_id)
    @communication = CommunicationSkill.find_by(:user_id=>@user.user_id)
    @thinking = ThinkingSkill.find_by(:user_id=>@user.user_id)
    @self = SelfDirectionSkill.find_by(:user_id=>@user.user_id)
    @accountability = Accountability.find_by(:user_id=>@user.user_id)
    @interpersonal = InterpersonalSkill.find_by(:user_id=>@user.user_id)

    if (@communication.nil?)
        @personality_progress = 0
    else
        @communication.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @thinking.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @self.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @accountability.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @interpersonal.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end
    end

    @personality_progress = (100*@personality_progress)/@total_personality_questions
    @DBprogress.personality_progress = @personality_progress
    @DBprogress.save
  end

end