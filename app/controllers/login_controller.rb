class LoginController < ApplicationController
  def create
    @user = User.authenticate(login_params[:email], login_params[:password])
    if @user
      flash[:alert] = "logged in!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "failed to log in!"
      redirect_to login_index_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def login_params
    params.require(:login).permit(:email, :password)
  end
end
