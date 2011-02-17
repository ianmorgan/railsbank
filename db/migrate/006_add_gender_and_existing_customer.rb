class AddGenderAndExistingCustomer < ActiveRecord::Migration
  def self.up
    #add_column :applicants, :gender, :string
    #add_column :applicants, :existing_customer, :boolean 
    add_column :applicants, :security_code, :string
  end

  def self.down
    #remove_column :appliants, :gender
    #remove_column :appliants, :existing_customer
    remove_column :appliants, :security_code 
  end
end