class UsersController < ApplicationController

#displays register & login root page
def index
end

#creates user into db
def create
  	@user = User.new( user_params )
  	if @user.save #if @user is successfully created... 
      session[:id] = @user.id
  	  redirect_to '/songs' #once created, will login to users's dashboard 
  	else
  	  flash[:errors] = @user.errors.full_messages #full_messages prints messages neatly!
  	  redirect_to :back #takes user back to refreshed registration page
  	end
end

def show
  @user = User.find(params[:id])
  @songs = @user.songs_added.group('songs.id')

end

#login user
def login
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:id] = user.id #set this session[:id] in order to reference as current_user
    redirect_to '/songs'
  else
    flash[:errors] = ["Email & Password Did Not Match!"]
    redirect_to :back #takes user back to refreshed reg/login pages
  end
end  

  #logout user
  def logout
    session[:id] = nil #destroys session id
    redirect_to action: "index" #redirects to 'users/index' which is log&reg page
  end








  #private user creation params
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end  
end
