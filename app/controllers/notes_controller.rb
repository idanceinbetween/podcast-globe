class NotesController < ApplicationController

  def new
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create

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

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
