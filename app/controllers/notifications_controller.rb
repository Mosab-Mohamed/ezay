class NotificationsController < ApplicationController

	def create
		### create new notification
			@user = User.find(@post.user_id)
			
		###

	end

	def notifications_show

		@oldNotifications = Notification.where(:user_id => current_user.id ,:seen => true)
		@oldNotifications = @oldNotifications.reverse
		@Ownnotifications = Notification.where(:user_id => current_user.id ,:seen => false)
		@notificationsNotSeen =  @Ownnotifications.reverse;
		@Ownnotifications.each do |noti|
       		 noti.update_attribute(:seen , true)
    	end

	end

	def checkForupdates

		newNoti = current_user.notifications.where( :popped => false )
		if newNoti.length > 0
			
			newNoti.each do |noti|
				noti.update_attribute(:popped,true)
			end
			respond_to do |f|
				f.js { render 'newNotifications'}
			end

		else
			respond_to do |f|
				f.js { render 'noNewNotifications'}
			end
		end
	end
end