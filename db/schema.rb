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

ActiveRecord::Schema.define(version: 20130609152550) do

  create_table "event_inquiries", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "event_date"
    t.string   "event_time"
    t.string   "event_type"
    t.string   "venue"
    t.string   "hours_required"
    t.string   "attendees"
    t.string   "cash_or_open_bar"
    t.string   "how_many_specialty_drinks"
    t.string   "budget"
    t.string   "serving_beer_and_wine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
