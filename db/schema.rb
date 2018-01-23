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

ActiveRecord::Schema.define(version: 20180123092635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", primary_key: "categoryid", id: :integer, limit: 2, force: :cascade do |t|
    t.string "categoryname", limit: 15, null: false
    t.text   "description"
    t.binary "picture"
  end

  create_table "customercustomerdemo", primary_key: ["customerid", "customertypeid"], force: :cascade do |t|
    t.string "customerid",     null: false
    t.string "customertypeid", null: false
  end

  create_table "customerdemographics", primary_key: "customertypeid", id: :string, force: :cascade do |t|
    t.text "customerdesc"
  end

  create_table "customers", primary_key: "customerid", id: :string, force: :cascade do |t|
    t.string "companyname",  limit: 40, null: false
    t.string "contactname",  limit: 30
    t.string "contacttitle", limit: 30
    t.string "address",      limit: 60
    t.string "city",         limit: 15
    t.string "region",       limit: 15
    t.string "postalcode",   limit: 10
    t.string "country",      limit: 15
    t.string "phone",        limit: 24
    t.string "fax",          limit: 24
  end

  create_table "employees", primary_key: "employeeid", id: :integer, limit: 2, force: :cascade do |t|
    t.string  "lastname",        limit: 20,  null: false
    t.string  "firstname",       limit: 10,  null: false
    t.string  "title",           limit: 30
    t.string  "titleofcourtesy", limit: 25
    t.date    "birthdate"
    t.date    "hiredate"
    t.string  "address",         limit: 60
    t.string  "city",            limit: 15
    t.string  "region",          limit: 15
    t.string  "postalcode",      limit: 10
    t.string  "country",         limit: 15
    t.string  "homephone",       limit: 24
    t.string  "extension",       limit: 4
    t.binary  "photo"
    t.text    "notes"
    t.integer "reportsto",       limit: 2
    t.string  "photopath",       limit: 255
  end

  create_table "employeeterritories", primary_key: ["employeeid", "territoryid"], force: :cascade do |t|
    t.integer "employeeid",  limit: 2,  null: false
    t.string  "territoryid", limit: 20, null: false
  end

  create_table "order_details", primary_key: ["orderid", "productid"], force: :cascade do |t|
    t.integer "orderid",   limit: 2, null: false
    t.integer "productid", limit: 2, null: false
    t.float   "unitprice",           null: false
    t.integer "quantity",  limit: 2, null: false
    t.float   "discount",            null: false
  end

  create_table "orders", primary_key: "orderid", id: :integer, limit: 2, force: :cascade do |t|
    t.string  "customerid"
    t.integer "employeeid",     limit: 2
    t.date    "orderdate"
    t.date    "requireddate"
    t.date    "shippeddate"
    t.integer "shipvia",        limit: 2
    t.float   "freight"
    t.string  "shipname",       limit: 40
    t.string  "shipaddress",    limit: 60
    t.string  "shipcity",       limit: 15
    t.string  "shipregion",     limit: 15
    t.string  "shippostalcode", limit: 10
    t.string  "shipcountry",    limit: 15
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", primary_key: "productid", id: :integer, limit: 2, force: :cascade do |t|
    t.string  "productname",     limit: 40, null: false
    t.integer "supplierid",      limit: 2
    t.integer "categoryid",      limit: 2
    t.string  "quantityperunit", limit: 20
    t.float   "unitprice"
    t.integer "unitsinstock",    limit: 2
    t.integer "unitsonorder",    limit: 2
    t.integer "reorderlevel",    limit: 2
    t.integer "discontinued",               null: false
  end

  create_table "region", primary_key: "regionid", id: :integer, limit: 2, force: :cascade do |t|
    t.string "regiondescription", null: false
  end

  create_table "shippers", primary_key: "shipperid", id: :integer, limit: 2, force: :cascade do |t|
    t.string "companyname", limit: 40, null: false
    t.string "phone",       limit: 24
  end

  create_table "suppliers", primary_key: "supplierid", id: :integer, limit: 2, force: :cascade do |t|
    t.string "companyname",  limit: 40, null: false
    t.string "contactname",  limit: 30
    t.string "contacttitle", limit: 30
    t.string "address",      limit: 60
    t.string "city",         limit: 15
    t.string "region",       limit: 15
    t.string "postalcode",   limit: 10
    t.string "country",      limit: 15
    t.string "phone",        limit: 24
    t.string "fax",          limit: 24
    t.text   "homepage"
  end

  create_table "territories", primary_key: "territoryid", id: :string, limit: 20, force: :cascade do |t|
    t.string  "territorydescription",           null: false
    t.integer "regionid",             limit: 2, null: false
  end

  create_table "usstates", id: false, force: :cascade do |t|
    t.integer "stateid",     limit: 2,   null: false
    t.string  "statename",   limit: 100
    t.string  "stateabbr",   limit: 2
    t.string  "stateregion", limit: 50
  end

  add_foreign_key "customercustomerdemo", "customerdemographics", column: "customertypeid", primary_key: "customertypeid", name: "fk_customercustomerdemo_customerdemographics"
  add_foreign_key "customercustomerdemo", "customers", column: "customerid", primary_key: "customerid", name: "fk_customercustomerdemo_customers"
  add_foreign_key "employees", "employees", column: "reportsto", primary_key: "employeeid", name: "fk_employees_employees"
  add_foreign_key "employeeterritories", "employees", column: "employeeid", primary_key: "employeeid", name: "fk_employeeterritories_employees"
  add_foreign_key "employeeterritories", "territories", column: "territoryid", primary_key: "territoryid", name: "fk_employeeterritories_territories"
  add_foreign_key "order_details", "orders", column: "orderid", primary_key: "orderid", name: "fk_order_details_orders"
  add_foreign_key "order_details", "products", column: "productid", primary_key: "productid", name: "fk_order_details_products"
  add_foreign_key "orders", "customers", column: "customerid", primary_key: "customerid", name: "fk_orders_customers"
  add_foreign_key "orders", "employees", column: "employeeid", primary_key: "employeeid", name: "fk_orders_employees"
  add_foreign_key "orders", "shippers", column: "shipvia", primary_key: "shipperid", name: "fk_orders_shippers"
  add_foreign_key "products", "categories", column: "categoryid", primary_key: "categoryid", name: "fk_products_categories"
  add_foreign_key "products", "suppliers", column: "supplierid", primary_key: "supplierid", name: "fk_products_suppliers"
  add_foreign_key "territories", "region", column: "regionid", primary_key: "regionid", name: "fk_territories_region"
end
