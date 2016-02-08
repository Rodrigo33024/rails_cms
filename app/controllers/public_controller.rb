class PublicController < ApplicationController

  before_action :setup_navigation
  def index
  end

  def show
    @page = Page.where(:permalink => params[:permalink], :visible => true).first
    if @page.nil?
      redirect_to(:action => 'index')
    else
      #show page content
    end
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end
end
