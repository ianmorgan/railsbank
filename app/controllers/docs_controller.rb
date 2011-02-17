class DocsController < ApplicationController
  layout "docs"
  
  def privacy_and_confidentiality
  end

  def pds
  end

  def fsg
  end

  def promotional
  end
  
  private
  
  def get_mname
    caller[0]=~/`(.*?)'/  # note the first quote is a backtick
    $1
  end


end
