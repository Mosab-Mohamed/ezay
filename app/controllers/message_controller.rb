class MessageController < ApplicationController

	def create
		@id = params[:id]
		@user = User.find(@id)
		@message = @user.messages.create(:body => params[:body], :sender_id => current_user.id, :reciever_id => @id)
		redirect_to '/'

	end

 	def msg_form
 		@id = params[:id]
 		@user = User.find(@id)
 	end

 	def msg_show

 		@oldMessages = Message.where(:reciever_id => current_user.id ,:seen => true)
		@oldMessages = @oldMessages.reverse
		@OwnMessages = Message.where(:reciever_id => current_user.id ,:seen => false)
		@MessagesNotSeen =  @OwnMessages.reverse;
		
 		@OwnMessages.each do |msg|
 			msg.update_attribute(:seen , true)
 		end
 	end


end
