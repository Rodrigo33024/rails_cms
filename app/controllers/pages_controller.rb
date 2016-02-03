class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(pages_params)

    if @page.save
      flash[:notice] = 'Page created successfully.'
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(pages_params)
      flash[:notice] = 'Page updated successfully.'
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def pages_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end
end
