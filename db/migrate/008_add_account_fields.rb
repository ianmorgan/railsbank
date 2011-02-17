class AddAccountFields < ActiveRecord::Migration
  def self.up
    add_column :account_applications, :transfer_using_existing_account, :boolean 
    add_column :account_applications, :customer_registration_number, :string
    add_column :account_applications, :setup_new_account, :string 
    add_column :account_applications, :require_debit_card, :boolean 
    add_column :account_applications, :require_cheque_book, :boolean 
  end

  def self.down
    remove_column :account_applications, :transfer_using_existing_account
    remove_column :account_applications, :customer_registration_number
    remove_column :account_applications, :setup_new_account
    remove_column :account_applications, :require_debit_card 
    remove_column :account_applications, :require_cheque_book
  end
end