class UsersController < ApplicationController
  def create
  @user = User.create(user_params)

  redirect_to user_path(@user)
end

def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
  @podcasts = @user.podcasts
  @favourite_episodes = @user.favourite_episodes
  @notes = @user.notes
end

def profile
  if !@current_user
    flash[:notice] = "Please sign in to continue!"
    redirect_to "/login_form"
  else
    @user = User.find(session[:user_id])
    @podcasts = @user.podcasts
    @favourite_episodes = @user.favourite_episodes
    @notes = @user.notes
  end
end

private

def user_params
  params.require(:user).permit(:username, :password)
end

end
