class Address < ActiveRecord::Base
  belongs_to :applicant
  
  #Virtual attributes for handling overseas addresses in GUI
  attr_accessor :state_province
  attr_accessor :zip_post_code

  validates_presence_of :country, :line1, :suburb
  validates_format_of :post_code, :with => /^[0-9]{4}$/,
                      :allow_blank => true,
                      :unless => :overseas_address,
                      :message => '^Enter a valid Australian post code'
  
  validates_presence_of :state, :post_code, :unless => :overseas_address
  validates_presence_of :state_province, :zip_post_code, :if => :overseas_address
  

   
  # works but ugly - there must be a neater solution?
  def restore_from_hash(params)
    if params != nil
      update_attributes(params)
      errors.clear
    end
  end
  
  def overseas_address
    country != "Australia"
  end
  
  def before_save
    if self.overseas_address
      self.state = self.state_province
      self.post_code = self.zip_post_code
    end
    return true
  end
  
  def after_initialize 
    if self.overseas_address
      self.state_province = self.state
      self.zip_post_code = self.post_code
    end
    return true
  end
  
  def self.human_attribute_name(attr)
    {:zip_post_code => "Zip/Post code", :state_province => "State/Province" }[attr.to_sym] || super
  end
    
  
end
