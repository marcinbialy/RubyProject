module ApplicationHelper
	def login_helper
		 if current_user.is_a?(GuestUser) 
          (link_to "Register", new_user_registration_path) + " ".html_safe +
          (link_to "Login", new_user_session_path) 
 		 else 
     		 link_to "Logout", destroy_user_session_path, method: :delete 
  		end 
	end

	def source_helper(layout_name)
		if session[:source]
      		greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      		content_tag(:p, greeting, class: "source-greeting")
    	end 
	end

  def set_copyright_helper
    @copyright = MBViewTool::Render.copyright 'Marcin', 'All rights reserved.'
  end

end

module MBViewTool
  class Render
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end

