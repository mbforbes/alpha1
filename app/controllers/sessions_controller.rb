class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_mtgname(params[:session][:mtgname].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
    	@errors = ['Invalid mortragian/password combination']
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
