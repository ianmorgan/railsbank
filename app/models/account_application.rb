class AccountApplication < ActiveRecord::Base
  has_many :applicants do 
    def primary
      @primary ||= find_or_initialize_by_applicant_type 'PRIMARY'
    end
    def joint 
      @joint ||= find_or_initialize_by_applicant_type 'JOINT'
    end
  end
  
  validates_presence_of :accept_privacy, :message => "^You must accept the privacy and confidentiality conditions"
  validates_presence_of :accept_read_documents, :message => "^You must acknowledge that you have had an opportunity to read the documents provided"
  
  def generate_confirmation_code
    if confirmation_code == nil
      chars = ("A".."Z").to_a + ("0".."9").to_a
      newcode = ""
      6.times { newcode << chars[rand(chars.size-1)] }
      update_attribute(:confirmation_code,newcode)
    end
  end
  
end
