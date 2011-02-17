class AddContactAddressFlag < ActiveRecord::Migration
  def self.up
    add_column :applicants, :contact_address_same, :boolean 
   end

  def self.down
    remove_column :applicants, :contact_address_same
   end
end