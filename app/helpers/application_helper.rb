module ApplicationHelper
	def login_helper style = ''
		 if current_user.is_a?(GuestUser) 
          (link_to "Register", new_user_registration_path, class: style) + " ".html_safe +
          (link_to "Login", new_user_session_path, class: style) 
 		 else 
     		 link_to "Logout", destroy_user_session_path, method: :delete, class: style
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

# creating list for navigation helper
  def nav_list_items
      [
        {
          url: root_path, 
          title: "Home"
        },
        {
          url: about_path, 
          title: "About"
        },
        {
          url: contact_path, 
          title: "Contact"
        },
        {
          url: blogs_path, 
          title: "Blog"
        },
        {
          url: portfolio_index_path, 
          title: "Portfolio"
        },
      ]
    end

# main helper for navbar 
    def nav_helper style, tag_type
      nav_links = ''

      nav_list_items.each do |item|
        nav_links<< "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
      end

      nav_links.html_safe
    end

# creating swith for navbar activ class
    def active? path 
      "active" if current_page? path
    end

end

module MBViewTool
  class Render
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
