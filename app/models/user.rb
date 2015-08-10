class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	# hashes and salts password and gives authenticate method 
	has_secure_password

end
