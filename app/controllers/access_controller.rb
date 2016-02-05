class AccessController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def index
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        autorized_user = found_user.authenticate(params[:password])
      end
    end

    if autorized_user

      session[:user_id] = autorized_user.id
      session[:username] = autorized_user.username

      flash[:notice] = "You are now logged in."
      redirect_to(:action => "menu")
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => "login")
    end
  end

  def logout

    session[:user_id] = nil
    session[:username] = nil

    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  def menu
    render("index")
  end

end
