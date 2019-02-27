class Blog < ApplicationRecord
	enum status: {draft: 0, published: 1}
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	has_many :comments, dependent: :destroy

  	validates_presence_of :title, :body

  	belongs_to :topic, optional: true

  	def self.recent
  		order(created_at: :desc)
  	end
end
