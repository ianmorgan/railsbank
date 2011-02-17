class Applicant < ActiveRecord::Base
  belongs_to :account_application
  has_many :addresses do 
    def main 
      @main ||= find_or_initialize_by_address_type('MAIN')
    end
    def contact 
      @contact ||= find_or_initialize_by_address_type('CONTACT') 
    end
  end
  
  validates_presence_of :title, :first_name, :surname, :occupation, :gender
  validates_inclusion_of :existing_customer, :in => [true, false], :message => '^Existing Customer missing'
  validates_inclusion_of :gender, :in => ['M', 'F'], :allow_nil => true
  validates_date :dob, :before => Proc.new { 16.years.until.to_date }, :before_message => "^The mininum age is 16"
  validate :security_code_valid
  validates_confirmation_of :security_code, :if => :confirm_security_code_required?
  

  def confirm_security_code_required?
    !existing_customer 
  end
  
  def security_code_valid
    if confirm_security_code_required?
      unless security_code &&
         security_code.length >= 4 &&
         security_code.match(/[0-9]/) &&
         security_code.upcase.match(/[A-Z]/) 
         
        errors.add("security_code", " must be at least 4 characters long and contain at least one letter and one number") 
      end
    end
  end

  
  def formatted_name
    "#{title} #{first_name} #{middle_name} #{surname}"
  end
  
  def formatted_gender
    {'M' => 'Male', 'F' => 'Female'}[gender]
  end
  
  def formatted_applicant_type
    {'PRIMARY' => 'Yourself', 'JOINT' => 'Additional Applicant'}[applicant_type]
  end


  def validate
    errors.add(:dob, "is invalid") if @dob_format_invalid 
  end

  def self.human_attribute_name(attr)
    {:dob => "Date of Birth"}[attr.to_sym] || super
  end
  
  # works but ugly - there must be a neater solution?
  def restore_from_hash(params)
    if params != nil
      update_attributes(params)
      errors.clear
    end
  end
  


end
