class UsersController < ApplicationController
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # TODO: read the setting before the system sends the sms notification
      SendSmsJob.perform_async(@user.email)
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render turbo_stream: turbo_stream.replace("signup-form", partial: "form")
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
