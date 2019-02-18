class Portf < ApplicationRecord

	validates_presence_of :title, :body, :main_image, :thumb_image

	def self.dotnet
		where(subtitle: '.NET')
	end

	scope :ruby_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}
end
