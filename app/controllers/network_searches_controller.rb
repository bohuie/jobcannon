class NetworkSearchesController < ApplicationController

  def create
    @search = NetworkSearch.new
    @search.update_attributes(search_params)
    @search.save
    respond_to do |f|
      f.js { render 'shared/ajax/all_search.js.erb' }
    end
  end
  
  private

  def search_params
        params.require(:network_search).permit(:user_id, :query, :qtype)
  end

end