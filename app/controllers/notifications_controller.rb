class NotificationsController < ApplicationController

	def create
		### create new notification
			@user = User.find(@post.user_id)
			
		###

	end

	def Notifications_show

		@Ownnotifications = Notification.where(:user_id => current_user.id ,:seen => false)
		@notificationsNotSeen =  @Ownnotifications;
		@Ownnotifications.each do |noti|
       		 noti.update_attribute(:seen , true)
    	end

	end
end
