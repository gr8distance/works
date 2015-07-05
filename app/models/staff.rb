class Staff < ActiveRecord::Base
	belongs_to :user

	has_many :works
	has_many :fees

end
