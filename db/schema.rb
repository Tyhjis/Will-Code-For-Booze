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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140408112314) do

  create_table "articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "title"
    t.string   "booktitle"
    t.integer  "year"
    t.string   "editor"
    t.integer  "volume"
    t.string   "series"
    t.integer  "pagestart"
    t.integer  "pageend"
    t.string   "address"
    t.integer  "month"
    t.string   "organization"
    t.string   "publisher"
    t.string   "note"
    t.string   "annote"
    t.string   "chapter"
    t.string   "crossref"
    t.string   "edition"
    t.string   "eprint"
    t.string   "howpublished"
    t.string   "institution"
    t.string   "journal"
    t.string   "key"
    t.integer  "number"
    t.string   "school"
    t.string   "referencetype"
    t.string   "url"
  end

end
