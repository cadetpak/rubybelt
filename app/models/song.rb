class Song < ActiveRecord::Base
has_many :plays
has_many :users_adding, through: :plays, source: :user

validates :artist, :title, presence: true
validates :title, :artist, length: { in: 2...35 }


end
