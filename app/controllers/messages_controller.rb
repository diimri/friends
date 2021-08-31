class MessagesController < ApplicationController
  before_action :authenticate_user!


def create
  
    @message =Message.new(message_params)
    @message.user= current_user
    @message.save


    if @message.save
     redirect_to messages_box_path 
    else
      redirect_to @post, notice: 'Unable to add comment'
    end

    #   post.find.comments(new).user
  end




  def box
    # this i have made for chat box
    @messages = Message.all
    @message = Message.new
  end

  def allmessage
    
  end 

  private

  def message_params
    params.require(:message).permit(:body)
  end

end



#$('#chatbox').append("<%= j render @message, remote:true %>"); 




    # <% @messages.each do |message| %>
    #   <%= render 'messages/message', message: message %>

    # <% end %>