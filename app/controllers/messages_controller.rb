class MessagesController < ApplicationController

  #rackup faye.ru -E production -s thin
  #execute the above line of code in terminal to start the FAYE server. This will add instant broadcasting
  #to all messages. Otherwise, they won't load unless the page is refreshed.

  def index
  end

  def create
    puts "Creating the message"
    @message = Message.new(msg_params)
    @message.sent_at = DateTime.now - 7.hours
    @temp1 = @message.user_id
    @temp2 = @message.receiver_id
    if @temp1<@temp2  #lesser id comes first in the chat path and channel path
     @id1 = @temp1
     @id2 = @temp2
    else
      @id1 = @temp2
      @id2 = @temp1
    end
    @channel = "/"+@id1.to_s+"chatwith"+ @id2.to_s 
    @channel  #putting the channel here somehow makes it visible in messages/create.js.erb (no clue why)
    respond_to do |format|
      if @message.save
        puts "saved"
          format.js
        else
          puts "not saved"
      end
    end
  end

   private
    
    def msg_params
        params.require(:message).permit(:message, :user_id, :receiver_id, :sent_at, :sender_name)
    end

end