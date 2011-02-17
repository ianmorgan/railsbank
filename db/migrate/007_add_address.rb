class AddAddress < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :applicant_id
      t.string :address_type 
      t.string :country
      t.string :line1
      t.string :line2
      t.string :suburb 
      t.string :state
      t.string :post_code
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses 
  end
end
