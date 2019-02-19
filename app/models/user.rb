class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :name

  def first_name
  	self.name.split.first
  end

  def last_name
  	if self.name.split.count > 2
  		last = self.name.split.slice(1 .. -1).join(" ")
  	else
  		self.name.split.last
  	end
  end
         
end
