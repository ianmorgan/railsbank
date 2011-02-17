class CreateApplicant < ActiveRecord::Migration
  def self.up
    create_table :applicants do |t|
      t.integer :account_application_id 
      t.string :applicant_type 
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :surname
      t.string :gender
      t.date :dob
      t.string :occupation
      t.boolean :existing_customer

      t.timestamps
    end
  end

  def self.down
    drop_table :applicants
  end
end
