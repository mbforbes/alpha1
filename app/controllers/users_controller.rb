class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @errors = @user.errors.full_messages
    if @user.save
      render 'show'
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:mtgname, :realname,
        :email, :password, :password_confirmation)
    end
end
