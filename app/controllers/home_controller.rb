class HomeController < ApplicationController
  layout "home"
  
  def download
    render :html => "downloadd"   
  end
  
  def index
  end
end
