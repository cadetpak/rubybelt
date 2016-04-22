class SongsController < ApplicationController
#displays user dashboard
def index
  @user = User.find(current_user.id)
  @song = Song.all
end

#creates song
def create
  @song = Song.new( song_params )
  if @song.save #if @song is successfully created...
  	redirect_to '/songs'
  else
  	flash[:errors] = @song.errors.full_messages
  	redirect_to '/songs'
  end
end

#shows specific song info
def show
  @song = Song.find(params[:id]) 
  @users = @song.users_adding.group('users.id')
end

#adds song to playlist
def addplay
  Play.create(user: User.find(current_user.id), song: Song.find(params['song_id']))
  redirect_to '/songs'
end


  private
  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
