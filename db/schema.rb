# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 11) do

  create_table "account_applications", :force => true do |t|
    t.string   "account_type"
    t.boolean  "accept_privacy"
    t.boolean  "accept_read_documents"
    t.boolean  "accept_product_disclosure"
    t.boolean  "accept_promotional_material"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "joint_account"
    t.boolean  "transfer_using_existing_account"
    t.string   "customer_registration_number"
    t.string   "setup_new_account"
    t.boolean  "require_debit_card"
    t.boolean  "require_cheque_book"
    t.boolean  "additional_customer_has_same_address"
    t.string   "confirmation_code"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "address_type"
    t.string   "country"
    t.string   "line1"
    t.string   "line2"
    t.string   "suburb"
    t.string   "state"
    t.string   "post_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicants", :force => true do |t|
    t.integer  "account_application_id"
    t.string   "applicant_type"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "surname"
    t.string   "gender"
    t.date     "dob"
    t.string   "occupation"
    t.boolean  "existing_customer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "security_code"
    t.boolean  "contact_address_same"
  end

  create_table "applications", :force => true do |t|
    t.string   "account_type"
    t.boolean  "accept_privacy"
    t.boolean  "accept_read_documenmts"
    t.boolean  "accept_product_disclosure"
    t.boolean  "accept_promotional_material"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
