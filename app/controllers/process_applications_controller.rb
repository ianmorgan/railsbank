class ProcessApplicationsController < ApplicationController
  
  layout "internal"
  
  def list
    @apps = AccountApplication.find(:all)
  end
  
  def edit_application
    session[:app] = AccountApplication.find_by_id params[:id]
    session[:internal_user_flag] = true
    redirect_to :controller => 'online_saver', :action => 'preconditions'
  end
  
  def hello
    render :text => " hi #{params[:q]}"
  end

end