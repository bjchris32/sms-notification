class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by_email(user_params[:email]) || User.new(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
    else
      @user.errors.add(:base, "Invalid email or password")
      render turbo_stream: turbo_stream.replace("login-form", partial: "form")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
