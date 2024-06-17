class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
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
end
