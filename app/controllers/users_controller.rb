class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:danger] = "Unauthorized access!"
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Story of Plato!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
