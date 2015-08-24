class NotificationsController < ApplicationController

	def create
		### create new notification
			@user = User.find(@post.user_id)
			
		###

	end

	def Notifications_show

		@oldNotifications = Notification.where(:user_id => current_user.id ,:seen => true)
		@oldNotifications = @oldNotifications.reverse
		@Ownnotifications = Notification.where(:user_id => current_user.id ,:seen => false)
		@notificationsNotSeen =  @Ownnotifications.reverse;
		@Ownnotifications.each do |noti|
       		 noti.update_attribute(:seen , true)
    	end


	end
end
