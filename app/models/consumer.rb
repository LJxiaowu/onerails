class Consumer < ApplicationRecord
	before_save {email.downcase!}
	validates :name,presence:true,length: { maximum: 50 }
	VAVID_EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates :email,presence:true,length: { maximum: 255 },
	format: {with: VAVID_EMAIL_REGEX},uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end


