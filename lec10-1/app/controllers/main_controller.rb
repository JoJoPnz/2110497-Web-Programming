class MainController < ApplicationController
  before_action :must_be_logged_in, only: %i[ user_Items ]

  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u && u.authenticate(params[:password])
      redirect_to '/'
      session[:logged_in] = true
      session[:login_user_id] = u.id
    else
      redirect_to main_login_path, notice: 'wrong username or password'
    end
  end

  def destroy
    reset_session
  end

  def user_Items
    @login_user_id = session[:login_user_id].to_i
    @user = User.where(id: @login_user_id).first
  end
end
