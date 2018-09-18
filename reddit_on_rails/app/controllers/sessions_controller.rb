class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Invalid credentials']
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
