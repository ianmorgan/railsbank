class AddJointAccount < ActiveRecord::Migration
  def self.up
    add_column :account_applications, :joint_account, :boolean
  end

  def self.down
    remove_column :account_applications, :joint_account
  end
end
