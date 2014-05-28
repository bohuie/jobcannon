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

ActiveRecord::Schema.define(version: 20140220233716) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "index"
    t.string   "create"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chatviews", force: true do |t|
    t.integer  "id1",            default: 0, null: false
    t.integer  "id2",            default: 0, null: false
    t.integer  "viewer",         default: 0, null: false
    t.datetime "last_viewed_at",             null: false
  end

  create_table "experiences", force: true do |t|
    t.string   "title",            default: "", null: false
    t.string   "description",      default: "", null: false
    t.datetime "sdate",                         null: false
    t.datetime "fdate"
    t.string   "company_name",     default: "", null: false
    t.string   "company_address"
    t.string   "company_city"
    t.string   "company_province"
    t.string   "company_country"
    t.string   "supervisor"
    t.string   "supervisor_phone"
    t.integer  "user_id",                       null: false
    t.integer  "experience_id",                 null: false
  end

  create_table "fields", force: true do |t|
    t.integer "field_id",    null: false
    t.text    "description"
  end

  create_table "friendships", force: true do |t|
    t.integer  "friendship_id", default: 0,     null: false
    t.integer  "sender_id",                     null: false
    t.integer  "receiver_id",                   null: false
    t.datetime "sent_at",                       null: false
    t.boolean  "accepted",      default: false, null: false
    t.datetime "accepted_at"
  end

  create_table "links", force: true do |t|
    t.integer "project_id", null: false
    t.integer "link_id",    null: false
    t.string  "url",        null: false
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id",   default: 0,  null: false
    t.integer  "receiver_id", default: 0,  null: false
    t.datetime "sent_at",                  null: false
    t.text     "message",     default: "", null: false
    t.string   "sender_name"
  end

  create_table "postings", force: true do |t|
    t.string  "title",       default: "", null: false
    t.string  "description", default: "", null: false
    t.integer "salary"
    t.integer "user_id",                  null: false
    t.integer "posting_id",  default: 0,  null: false
  end

  create_table "projects", force: true do |t|
    t.string  "name",          null: false
    t.string  "description"
    t.integer "project_id",    null: false
    t.integer "experience_id", null: false
  end

  create_table "references", force: true do |t|
    t.string  "fname",        default: "", null: false
    t.string  "lname",        default: "", null: false
    t.string  "phone_number"
    t.string  "relationship", default: "", null: false
    t.integer "yrsknown"
    t.string  "email"
    t.integer "reference_id", default: 0,  null: false
    t.integer "user_id",                   null: false
  end

  create_table "skilllabels", force: true do |t|
    t.integer "skilllabel_id", default: 0,  null: false
    t.string  "label",         default: "", null: false
  end

  create_table "skills", force: true do |t|
    t.integer "skill_id",   default: 0,  null: false
    t.string  "label",      default: "", null: false
    t.integer "user_id",    default: 0,  null: false
    t.integer "posting_id"
    t.boolean "mandatory"
  end

  create_table "surveyprofiles", force:true do |t|
    t.integer "user_id",   default: 0, null: false
    t.integer "survey_id", default: 0, null: false
    t.string "postalcode"
    t.string "education"
    t.string   "city"
    t.string   "province"    
    t.string   "gender",   default: nil
    t.datetime "birthday"
  end

  create_table "experiencetables", force:true do |t|
    t.integer "user_id",   default: 0, null: false
    t.integer "survey_id", default: 0, null: false
    t.integer "years_worked"
    t.integer "months_worked"
    t.boolean "agriculture"
    t.boolean "mining"
    t.boolean "utilities"
    t.boolean "construction"
    t.boolean "manufacturing"
    t.boolean "wholesale"
    t.boolean "retail"
    t.boolean "transport"
    t.boolean "information"
    t.boolean "finance"
    t.boolean "real_estate"
    t.boolean "professional"
    t.boolean "managment"
    t.boolean "administrative"
    t.boolean "education"
    t.boolean "health"
    t.boolean "arts"
    t.boolean "accomodation"
    t.boolean "public"
    t.boolean "full_time",   default: false, null: false
    t.boolean "part_time",   default: false, null: false
    t.boolean "volunteer",   default: false, null: false
    t.boolean "employ",   default: false, null: false
    t.boolean "vol_work", default: false, null: false
    t.integer "vol_hours"
    t.string "other"
  end

  create_table "users", force: true do |t|
    t.integer  "user_id",                default: 0,     null: false
    t.string   "username",               default: "",    null: false
    t.string   "fname",                  default: "",    null: false
    t.string   "lname",                  default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"   
    t.boolean  "employee",               default: true
    #t.string   "goals",                  default: "",    null: false
    t.boolean  "employer",               default: false, null: false
    #t.string   "company_name",           default: ""
    #t.string   "company_address",        default: ""
    #t.string   "field",                  default: ""
    t.boolean  "admin",                  default: false, null: false
    #t.string   "uid"
    #t.string   "provider"
    t.string   "city"
    t.string   "province"    
    t.string   "gender"
    t.datetime "last_seen_at"
    t.string   "info"  #user personal info that goes onto main page
    t.boolean  "online"
  end

 create_table "languages", force: true do |t|

  t.boolean "eng_speak", default: false
  t.boolean "eng_read", default: false
  t.boolean "eng_write", default: false
  t.boolean "eng_formal", default: false

  t.boolean "fren_speak", default: false
  t.boolean "fren_read", default: false
  t.boolean "fren_write", default: false
  t.boolean "fren_formal", default: false

  t.boolean "spnish_speak", default: false
  t.boolean "spnish_read", default: false
  t.boolean "spnish_write", default: false
  t.boolean "spnish_formal", default: false

  t.boolean "tagalog_speak", default: false
  t.boolean "tagalog_read", default: false
  t.boolean "tagalog_write", default: false
  t.boolean "tagalog_formal", default: false


  t.boolean "mandarin_speak", default: false
  t.boolean "mandarin_read", default: false
  t.boolean "mandarin_write", default: false
  t.boolean "mandarin_formal", default: false

  t.boolean "cantonese_speak", default: false
  t.boolean "cantonese_read", default: false
  t.boolean "cantonese_write", default: false
  t.boolean "cantonese_formal", default: false

  t.boolean "punjabi_speak", default: false
  t.boolean "punjabi_read", default: false
  t.boolean "punjabi_write", default: false
  t.boolean "punjabi_formal", default: false

  t.boolean "urdu_speak", default: false
  t.boolean "urdu_read", default: false
  t.boolean "urdu_write", default: false
  t.boolean "urdu_formal", default: false

  t.boolean "tamil_speak", default: false
  t.boolean "tamil_read", default: false
  t.boolean "tamil_write", default: false
  t.boolean "tamil_formal", default: false

  t.boolean "persian_speak", default: false
  t.boolean "persian_read", default: false
  t.boolean "persian_write", default: false
  t.boolean "persian_formal", default: false

  t.boolean "italian_speak", default: false
  t.boolean "italian_read", default: false
  t.boolean "italian_write", default: false
  t.boolean "italian_formal", default: false

  t.string "other"
  t.boolean "other_read", default: false
  t.boolean "other_speak", default: false
  t.boolean "other_write", default: false
  t.boolean "other_formal", default: false

  t.integer "user_id"
  t.integer "language_id"
 end

 create_table "communication_skills", force: true do |t|
  t.integer "user_id"
  t.integer "communication_skills_id"
  t.integer "q1"
  t.integer "q2"
  t.integer "q3"
  t.integer "q4"
  t.integer "q5"
  t.integer "q6"
  t.integer "q7"
  t.integer "q8"
  t.integer "q9"
  t.integer "q10"
  t.integer "q11"
 end

create_table "thinking_skills", force: true do |t|
  t.integer "user_id"
  t.integer "thinking_skills_id"
  t.integer "q1"
  t.integer "q2"
  t.integer "q3"
  t.integer "q4"
  t.integer "q5"
  t.integer "q6"
  t.integer "q7"
  t.integer "q8"  
end

create_table "self_direction_skills", force: true do |t|
  t.integer "user_id"
  t.integer "sd_skills_id"
  t.integer "q1"
  t.integer "q2"
  t.integer "q3"
  t.integer "q4"
  t.integer "q5"
  t.integer "q6"
  t.integer "q7"
  t.integer "q8"
  t.integer "q9"
  t.integer "q10"
  t.integer "q11"
end


 create_table "accountabilities", force: true do |t|
  t.integer "user_id"
  t.integer "accountability_id"
  t.integer "q1"
  t.integer "q2"
  t.integer "q3"
  t.integer "q4"
  t.integer "q5"  
 end

create_table "interpersonal_skills", force: true do |t|
  t.integer "user_id"
  t.integer "interpersonal_skills_id"
  t.integer "q1"
  t.integer "q2"
  t.integer "q3"
  t.integer "q4"
  t.integer "q5"
  t.integer "q6"
  t.integer "q7"
  t.integer "q8"
  t.integer "q9"  
end

end
