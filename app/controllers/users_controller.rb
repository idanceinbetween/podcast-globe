class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    session[:user_id] ? @me = User.find(session[:user_id]) : @me = nil
    @podcasts = @user.podcasts
    @favourite_episodes = @user.favourite_episodes
    @notes = @user.notes
  end

  def new
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      @podcasts = @user.podcasts
      @favourite_episodes = @user.favourite_episodes
      @notes = @user.notes
      redirect_to @user
    else
      flash[:notice] = "User creation failed. Please try again"
      redirect_to new_user_path
    end
  end

  def profile
    if !@current_user
      flash[:notice] = "Please sign in to continue!"
      redirect_to login_form_path
    else
      @user = User.find(session[:user_id])
      @podcasts = @user.podcasts
      @favourite_episodes = @user.favourite_episodes
      @notes = @user.notes
      @id = session[:user_id]
    end
  end

  def edit

  end

  def update

  end

  def destroy
    byebug
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  def followship
    @user = User.find(params[:id])
    session[:user_id] ? @me = User.find(session[:user_id]) : @me = nil
    current_user.toggle_followship(@user)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
