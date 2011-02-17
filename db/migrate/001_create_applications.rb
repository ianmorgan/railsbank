class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :account_type
      t.boolean :accept_privacy
      t.boolean :accept_read_documenmts
      t.boolean :accept_product_disclosure
      t.boolean :accept_promotional_material
      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
