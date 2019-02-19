module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		# if current_user egzist do nothing else set guest user (null object pattern)
		super || guest_user
	end

	def guest_user
		OpenStruct.new(name:"Guest User", 
					   first_name: "Guest", 
					   last_name: "User", 
					   email: "guest@exsample.com"
					   )
	end
end