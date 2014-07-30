class NetworkSearchesController < ApplicationController

  def create
    @search = NetworkSearch.new
    @search.update_attributes(search_params)
    @search.save
    puts @search.networktype.to_s.eql? "friends"
    if @search.networktype.to_s.eql? "friends"
      respond_to do |f|
        f.js { render 'shared/ajax/friends_search.js.erb' }
      end
    elsif @search.networktype.eql? "business"
      respond_to do |f|
        f.js { render 'shared/ajax/business_search.js.erb' }
      end
    else
      respond_to do |f|
        f.js { render 'shared/ajax/both_search.js.erb' }
      end
    end
  end
  
  private

  def search_params
        params.require(:network_search).permit(:user_id, :query, :qtype, :networktype)
  end

end