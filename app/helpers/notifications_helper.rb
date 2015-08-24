module NotificationsHelper

	def notification_icon
			
		@notifications = current_user.notifications.where(:seen => false )

		if @notifications.length >0
			"notifications.PNG"
		else
			"notifications2.png"
		end
	end
end
