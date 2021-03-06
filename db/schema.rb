# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_610_184_456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'type_transaction_id'
    t.datetime 'date'
    t.float 'value'
    t.string 'cpf'
    t.string 'card'
    t.string 'hour'
    t.string 'store_manager'
    t.string 'store_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['type_transaction_id'], name: 'index_transactions_on_type_transaction_id'
  end

  create_table 'type_transactions', force: :cascade do |t|
    t.integer 'type_code'
    t.string 'description'
    t.string 'label'
    t.boolean 'value'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'transactions', 'type_transactions'
end
