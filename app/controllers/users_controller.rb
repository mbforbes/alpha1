class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    render 'new'
  end

  private
    def user_params
      params.require(:user).permit(:mtgname, :realname,
        :email, :password, :password_confirmation)
    end
end
