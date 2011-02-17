class CreateAccountApplications < ActiveRecord::Migration
  def self.up
    create_table :account_applications do |t|
      t.string :account_type
      t.boolean :accept_privacy
      t.boolean :accept_read_documents
      t.boolean :accept_product_disclosure
      t.boolean :accept_promotional_material

      t.timestamps
    end
  end

  def self.down
    drop_table :account_applications
  end
end
