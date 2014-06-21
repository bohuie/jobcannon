class NetworkSearchesController < ApplicationController

  def create
    @search = NetworkSearch.new
    @search.update_attributes(search_params)
    @search.save
    if @search.type == "name"
      respond_to do |f|
        f.js { render 'shared/ajax/name_search.js.erb' }
      end
    else
      respond_to do |f|
        f.js { render 'shared/ajax/skill_search.js.erb' }
      end
    end
  end
  
  private

  def search_params
        params.require(:network_search).permit(:user_id, :query, :type)
  end

end