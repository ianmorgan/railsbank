class AddConfirmationCodeToAccountApplications < ActiveRecord::Migration
  def self.up
    add_column :account_applications, :confirmation_code, :string
  end

  def self.down
    remove_column :account_applications, :confirmation_code
  end
end
