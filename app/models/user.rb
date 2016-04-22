class User < ActiveRecord::Base
has_many :songs
has_many :plays, dependent: :destroy
has_many :songs_added, through: :plays, source: :song

  has_secure_password

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :first_name, :last_name, :email, presence: true
	
end
