module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		# if current_user egzist do nothing else set guest user (null object pattern)
		super || guest_user
	end

	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.first_name = "Guest"
		guest.last_name = "User"
		guest.email = "guest@exsample.com"
		guest
	end
end