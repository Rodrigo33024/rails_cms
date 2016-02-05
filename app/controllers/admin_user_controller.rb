class AdminUserController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @adminUsers = AdminUser.sorted
  end

  def new
    @adminUser = AdminUser.new
  end

  def create
    @adminUser = AdminUser.new(adminUser_params)

    if @adminUser.save
      flash[:notice] = "Admin Created"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @adminUser = AdminUser.find(params[:id])
  end

  def update
    @adminUser = AdminUser.find(params[:id])
    if @adminUser.update_attributes(adminUser_params)
      flash[:notice] = "Admin Updated"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def delete
    @adminUser = AdminUser.find(params[:id])
  end

  def destroy
    adminUser = AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin '#{adminUser.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def adminUser_params
    params.require(:adminUser).permit(:first_name, :last_name, :email, :username, :password)
  end
end
