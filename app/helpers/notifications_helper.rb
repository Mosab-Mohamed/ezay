module NotificationsHelper

	def notification_icon
			
		@notifications = current_user.notifications.where(:seen => false )

		if @notifications.length >0

			@notifications.each do |noti|
				noti.update_attribute(:popped,true)
			end
			"notifications.PNG"
		else
			"notifications2.png"
		end
	end
end
