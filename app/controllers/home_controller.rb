class HomeController < ApplicationController
  def index
    @user_count = User.all.count
  end
end
