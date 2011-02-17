class OnlineSaverController < ApplicationController
  layout :application_layout
   

  def preconditions
    create_or_retrieve_application_from_session
    render :html => "preconditions"
  end
  
  def update_preconditions    
    create_or_retrieve_application_from_session
    
    if @app.update_attributes(params[:app])
      redirect_to :action => "personal_details"
    else
      render :action => "preconditions"
    end
  end
  
  def personal_details
    create_or_retrieve_application_from_session
    if session[:last_personal_details]
      @primary.restore_from_hash(session[:last_personal_details][:primary])
      @joint.restore_from_hash(session[:last_personal_details][:joint])
    end
    
    #render :text => 'here we are'
    render :html=> "personal_details"
  end
  
  def update_personal_details
    session[:last_personal_details] = nil
    create_or_retrieve_application_from_session
    
    success = @app.update_attributes(params[:app])
    success = @primary.update_attributes(params[:primary]) && success
    if @app.joint_account
      success = @joint.update_attributes(params[:joint]) && success
    end
  
    if params[:submit] == 'Prev'
      session[:last_personal_details] = params unless success
      redirect_to :action => "preconditions"
    else    
      if success 
        redirect_to :action => "account_details"
      else
        render :action => "personal_details"  
      end
    end
  end
  
  def account_details
    create_or_retrieve_application_from_session
    @countries = Country.find_all
    
    if session[:last_account_details]
      restore_account_details_for @primary, session[:last_account_details][:primary]
      if (@app.joint_account)
        restore_account_details_for @joint, session[:last_account_details][:joint]
      end
    end
    
    render :html => "account_details"
  end
  
  def update_account_details
    session[:last_account_details]  = nil
    create_or_retrieve_application_from_session
    
    success = @app.update_attributes(params[:app])
    success = update_account_details_for(@primary, params[:primary]) && success
    if @app.joint_account && !@app.additional_customer_has_same_address
      success = update_account_details_for(@joint, params[:joint]) && success
    end
    
    if params[:submit] == 'Prev'
      session[:last_account_details] = params unless success
      redirect_to :action => "personal_details"
    else
      if success
        redirect_to :action => "review"
      else
        @countries = Country.find_all
        render :action => "account_details"  
      end
    end
  end
  
  def review
    create_or_retrieve_application_from_session
    render :html => "review"
  end
  
  def complete
    create_or_retrieve_application_from_session
    clear_session
    @app.generate_confirmation_code
    render :html => "complete" 
  end
  
private 
  def update_account_details_for applicant, params
    success = applicant.update_attribute(:contact_address_same, params[:contact_address_same]) 
    success = applicant.addresses.main.update_attributes(params[:addresses][:main]) && success
    if !applicant.contact_address_same
        success =  applicant.addresses.contact.update_attributes(params[:addresses][:contact]) && success
    end
    return success
  end
  
  def restore_account_details_for applicant, params
    applicant.addresses.main.restore_from_hash(params[:addresses][:main])
    if !applicant.contact_address_same
        applicant.addresses.contact.restore_from_hash(params[:addresses][:contact])
    end
  end
  
  # rather ugly - should just be storing
  # the account application id and rereading from database
  def create_or_retrieve_application_from_session
    if session[:app] == nil
      session[:app] = AccountApplication.new
    end
    
    @app = session[:app]
    @primary = @app.applicants.primary
    @joint = @app.applicants.joint
  end
  
  def clear_session
    session[:app] = nil
  end
  
  def is_internal_user
    params[:site] == "internal" 
  end
  
  def application_layout 
    is_internal_user ? "internal" : "abank"
  end
end
