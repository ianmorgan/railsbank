class AddAdditionalCustomerHasSameAddressFlag < ActiveRecord::Migration
  def self.up
    add_column :account_applications, :additional_customer_has_same_address, :boolean   
  end

  def self.down
    remove_column :account_applications, :additional_customer_has_same_address
  end
end