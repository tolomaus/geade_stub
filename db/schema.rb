# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111124211808) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "child_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dependencies", ["child_id", "parent_id"], :name => "index_dependencies_on_child_id_and_parent_id", :unique => true
  add_index "dependencies", ["child_id"], :name => "index_dependencies_on_child_id"
  add_index "dependencies", ["parent_id"], :name => "index_dependencies_on_parent_id"

  create_table "pcrs", :force => true do |t|
    t.string   "code"
    t.string   "summary"
    t.string   "description"
    t.integer  "app_id",      :limit => 255
    t.integer  "release_id",  :limit => 255
    t.integer  "status_id",   :limit => 255
    t.integer  "severity_id", :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "severities", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
