# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address				=> 'smtp',
	:port					=> '587',
	:authentication			=> :plain,
	:user_name				=> 'mosab',
	:password				=> 'Mo011994292988',
	:domain					=> 'heroku.com',
	:enable_starttls_auto	=> true
}