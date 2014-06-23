class CreateAuthentications < ActiveRecord::Migration
  def change
    
    create_table :authentications do |t|
      t.integer  :user_id
      t.string   :provider
      t.string   :uid
      t.string   :index
      t.string   :create
      t.datetime :created_at
      t.datetime :updated_at
    end

create_table :network_searches do |t|
    t.integer :user_id, default: 0, null: false
    t.string :query
    t.string :type
    t.integer :search_id
  end

    create_table :endorses do |t|
      t.integer :skill_id
      t.integer :endorser_id
      t.integer :endorse_id
    end 
  create_table :photos do |t|
    t.integer :user_id
    t.string :photo_file_name
    t.string :photo_content_type
    t.integer :photo_file_size
    t.datetime :photo_updated_at 
    t.attachment :photo   
  end  

    create_table :chatviews do |t|
      t.integer  :id1,         default: 0, null: false
      t.integer  :id2,            default: 0, null: false
      t.integer  :viewer,         default: 0, null: false
      t.datetime :last_viewed_at,             null: false
    end

    create_table :experiences do |t|
      t.string   :title,            default: "", null: false
      t.string   :description,             default: "", null: false
      t.datetime :sdate,                         null: false
      t.datetime :fdate
      t.string   :company_name,     default: "", null: false
      t.string   :company_address
      t.string   :company_city
      t.string   :company_province
      t.string   :company_country
      t.string   :supervisor
      t.string   :supervisor_phone
      t.integer  :user_id,                       null: false
      t.integer  :experience_id,                 null: false
    end

    create_table :experiencetables do |t|
      t.integer :user_id,        default: 0,     null: false
      t.integer :survey_id,      default: 0,     null: false
      t.integer :years_worked
      t.integer :months_worked
      t.boolean :agriculture
      t.boolean :mining
      t.boolean :utilities
      t.boolean :construction
      t.boolean :manufacturing
      t.boolean :wholesale
      t.boolean :retail
      t.boolean :transport
      t.boolean :information
      t.boolean :finance
      t.boolean :real_estate
      t.boolean :professional
      t.boolean :managment
      t.boolean :administrative
      t.boolean :education
      t.boolean :health
      t.boolean :arts
      t.boolean :accomodation
      t.boolean :public
      t.boolean :full_time,      default: false, null: false
      t.boolean :part_time,      default: false, null: false
      t.boolean :volunteer,      default: false, null: false
      t.boolean :employ,         default: false, null: false
      t.boolean :looking_for_work
      t.boolean :vol_work
      t.integer :vol_hours
      t.string  :other
    end

    create_table :fields do |t|
      t.integer :field_id,    null: false
      t.text    :description
    end

    create_table :friendships do |t|
      t.integer  :friendship_id, default: 0,     null: false
      t.integer  :sender_id,                     null: false
      t.integer  :receiver_id,                   null: false
      t.datetime :sent_at,                       null: false
      t.boolean  :accepted,      default: false, null: false
      t.datetime :accepted_at
    end

    create_table :messages do |t|
      t.integer  :sender_id,   default: 0,  null: false
      t.integer  :receiver_id, default: 0,  null: false
      t.datetime :sent_at,                  null: false
      t.text     :message,     default: "", null: false
      t.boolean  :seen,         defalut: false
    end

    create_table :keywords do |t|
      t.string  :keyword,       default: "", null: false
      t.integer :posting_id,                 null: false
      t.integer :skill_id,                   null: false
      t.integer :experience_id,              null: false
    end

    create_table :links do |t|
      t.integer :project_id, null: false
      t.integer :link_id,    null: false
      t.string  :url,        null: false
    end

    create_table :postings do |t|
      t.string  :title,      default: "", null: false
      t.string  :description,       default: "", null: false
      t.integer :salary
      t.integer :user_id,                 null: false
      t.integer :posting_id,  default: 0,  null: false
    end

    create_table :projects do |t|
      t.string  :name,          null: false
      t.string  :description
      t.integer :project_id,    null: false
      t.integer :experience_id, null: false
    end

    create_table :references do |t|
      t.string  :fname,        default: "", null: false
      t.string  :lname,        default: "", null: false
      t.string  :phone_number
      t.string  :relationship, default: "", null: false
      t.integer :yrsknown
      t.string  :email
      t.integer :reference_id, default: 0,  null: false
      t.integer :user_id,                   null: false
    end

    create_table :skilllabels do |t|
      t.integer :skilllabel_id, default: 0,  null: false
      t.string  :label,         default: "", null: false
    end

    create_table :requirements do |t|
      t.boolean :mandatory,      default: true, null: false
      t.string  :degree
      t.string  :educationLvl
      t.string  :description,           default: "",   null: false
      t.integer :exp
      t.string  :exp_area
      t.integer :posting_id,                    null: false
      t.integer :requirement_id,                null: false
    end

    create_table :skills do |t|
      t.integer :skill_id,   default: 0,  null: false
      t.string  :label,      default: "", null: false
      t.integer :user_id,    default: 0,  null: false
      t.integer :posting_id
      t.boolean :mandatory
    end

    create_table :users do |t|
      t.integer  :user_id,                default: 0,     null: false
      t.string   :username,               default: "",    null: false
      t.string   :fname,                  default: "",    null: false
      t.string   :lname,                  default: "",    null: false
      t.string   :email,                  default: "",    null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :password_digest
      t.string   :remember_token
      t.string   :encrypted_password,     default: "",    null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          default: 0,     null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :phone_number
      t.string   :city
      t.string   :province
      t.string   :country
      t.string   :gender
      t.datetime :birthday
      t.boolean  :employee,               default: true
      t.string   :goals,                  default: "",    null: false
      t.boolean  :employer,               default: false, null: false
      t.string   :company_name,           default: ""
      t.string   :company_address,        default: ""
      t.string   :field,                  default: ""
      t.boolean  :admin,                  default: false, null: false
      t.string   :uid
      t.string   :provider
      t.boolean  :online
      t.string   :info
      t.datetime :last_seen_at  
    end

    create_table :surveyprofiles do |t|
      t.integer :user_id,   default: 0, null: false
      t.integer :survey_id, default: 0, null: false
      t.string  :postalcode
      t.string  :education
      t.string   :city
      t.string   :province    
      t.string   :gender,   default: nil
      t.datetime :birthday
    end

      create_table :languages do |t|

        t.boolean :eng_speak, default: false
        t.boolean :eng_read, default: false
        t.boolean :eng_write, default: false
        t.boolean :eng_formal, default: false

        t.boolean :fren_speak, default: false
        t.boolean :fren_read, default: false
        t.boolean :fren_write, default: false
        t.boolean :fren_formal, default: false

        t.boolean :spnish_speak, default: false
        t.boolean :spnish_read, default: false
        t.boolean :spnish_write, default: false
        t.boolean :spnish_formal, default: false

        t.boolean :tagalog_speak, default: false
        t.boolean :tagalog_read, default: false
        t.boolean :tagalog_write, default: false
        t.boolean :tagalog_formal, default: false


        t.boolean :mandarin_speak, default: false
        t.boolean :mandarin_read, default: false
        t.boolean :mandarin_write, default: false
        t.boolean :mandarin_formal, default: false

        t.boolean :cantonese_speak, default: false
        t.boolean :cantonese_read, default: false
        t.boolean :cantonese_write, default: false
        t.boolean :cantonese_formal, default: false

        t.boolean :punjabi_speak, default: false
        t.boolean :punjabi_read, default: false
        t.boolean :punjabi_write, default: false
        t.boolean :punjabi_formal, default: false

        t.boolean :urdu_speak, default: false
        t.boolean :urdu_read, default: false
        t.boolean :urdu_write, default: false
        t.boolean :urdu_formal, default: false

        t.boolean :tamil_speak, default: false
        t.boolean :tamil_read, default: false
        t.boolean :tamil_write, default: false
        t.boolean :tamil_formal, default: false

        t.boolean :persian_speak, default: false
        t.boolean :persian_read, default: false
        t.boolean :persian_write, default: false
        t.boolean :persian_formal, default: false

        t.boolean :italian_speak, default: false
        t.boolean :italian_read, default: false
        t.boolean :italian_write, default: false
        t.boolean :italian_formal, default: false

        t.string :other
        t.boolean :other_read, default: false
        t.boolean :other_speak, default: false
        t.boolean :other_write, default: false
        t.boolean :other_formal, default: false

        t.integer :user_id
        t.integer :language_id, default: 0,     null: false
     end

     create_table :communication_skills do |t|
      t.integer :user_id
      t.integer :communication_skills_id,  default: 0,     null: false
      t.integer :q1,                       default: 0,     null: false
      t.integer :q2,                       default: 0,     null: false
      t.integer :q3,                       default: 0,     null: false
      t.integer :q4,                       default: 0,     null: false
      t.integer :q5,                       default: 0,     null: false
      t.integer :q6,                       default: 0,     null: false
      t.integer :q7,                       default: 0,     null: false
      t.integer :q8,                       default: 0,     null: false
      t.integer :q9,                       default: 0,     null: false
      t.integer :q10,                      default: 0,     null: false
      t.integer :q11,                      default: 0,     null: false
     end

    create_table :thinking_skills do |t|
      t.integer :user_id
      t.integer :thinking_skills_id,      default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false
      t.integer :q8,                      default: 0,     null: false
    end

    create_table :self_direction_skills do |t|
      t.integer :user_id
      t.integer :sd_skills_id,            default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false
      t.integer :q8,                      default: 0,     null: false
      t.integer :q9,                      default: 0,     null: false
      t.integer :q10,                     default: 0,     null: false
      t.integer :q11,                     default: 0,     null: false
    end


     create_table :accountabilities do |t|
      t.integer :user_id
      t.integer :accountability_id,       default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
     end

    create_table :interpersonal_skills do |t|
      t.integer :user_id
      t.integer :interpersonal_skills_id, default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
    end

    create_table :basic_computer_skills do |t|
      t.integer :user_id
      t.integer :basic_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
      t.integer :q17,                     default: 0,     null: false 
      t.integer :q18,                     default: 0,     null: false 
      t.integer :q19,                     default: 0,     null: false 
      t.integer :q20,                     default: 0,     null: false 
      t.integer :q21,                     default: 0,     null: false 
      t.integer :q22,                     default: 0,     null: false   
    end

    create_table :operating_systems_usages do |t|
      t.integer :user_id
      t.integer :os_usages_id,            default: 0,     null: false   
      t.integer :windows,                 default: 0,     null: false  
      t.integer :mac,                     default: 0,     null: false  
      t.integer :linux,                   default: 0,     null: false  
      t.string :other  
    end

    create_table :operating_systems_fluents do |t|
      t.integer :user_id
      t.integer :os_fluent_id,            default: 0,     null: false
      t.integer :windows,                 default: 0,     null: false  
      t.integer :mac,                     default: 0,     null: false  
      t.integer :linux,                   default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other  
    end

    create_table :advanced_computer_skills do |t|
      t.integer :user_id
      t.integer :advanced_id,             default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
    end

    create_table :multi_media_skills do |t|
      t.integer :user_id
      t.integer :multi_media_id,          default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
    end

    create_table :technology_differences, forse: true do |t|
      t.integer :user_id
      t.integer :td_id,                   default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
    end

    create_table :word_processing_skills do |t|
      t.integer :user_id
      t.integer :word_id,                 default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
      t.integer :q17,                     default: 0,     null: false 
      t.integer :q18,                     default: 0,     null: false 
      t.integer :q19,                     default: 0,     null: false 
      t.integer :q20,                     default: 0,     null: false      
    end

    create_table :word_processing_fluentcies do |t|
      t.integer :user_id
      t.integer :word_fluentcy_id,        default: 0,     null: false  
      t.integer :word,                    default: 0,     null: false
      t.integer :pages,                   default: 0,     null: false
      t.integer :writer,                  default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other                   
    end

    create_table :spreadsheet_skills do |t|
      t.integer :user_id
      t.integer :spreadsheet_id,          default: 0,     null: false
      t.integer :word_id,                 default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
    end

    create_table :spreadsheet_fluentcies do |t|
      t.integer :user_id
      t.integer :spreadsheet_fluentcy_id, default: 0,     null: false
      t.integer :excel,                   default: 0,     null: false
      t.integer :numbers,                 default: 0,     null: false
      t.integer :calc,                    default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other
    end

    create_table :presenting_skills do |t|
      t.integer :user_id
      t.integer :presentation_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
      t.integer :q17,                     default: 0,     null: false   
    end

    create_table :presenting_fluentcies do |t|
      t.integer :user_id
      t.integer :presentation_fluentcy_id, default: 0,     null: false
      t.integer :powerpoint,                   default: 0,     null: false
      t.integer :keynote,                   default: 0,     null: false
      t.integer :impress,                 default: 0,     null: false
      t.integer :prezi,                    default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other
    end

    create_table :email_skills do |t|
      t.integer :user_id
      t.integer :email_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
    end

    create_table :email_fluentcies do |t|
      t.integer :user_id
      t.integer :email_fluentcy_id, default: 0,     null: false
      t.integer :outlook,                   default: 0,     null: false
      t.integer :mail,                   default: 0,     null: false
      t.integer :impress,                 default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other
    end

    create_table :internet_terms do |t|
      t.integer :user_id
      t.integer :internet_term_id, default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
    end

    create_table :internet_tasks do |t|
      t.integer :user_id
      t.integer :internet_task_id, default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
      t.integer :q17,                     default: 0,     null: false 

    end

    create_table :internet_connections do |t|
      t.integer :user_id
      t.integer :internet_connection_id, default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.boolean :q1a,                      default: false,     null: false
      t.boolean :q1b,                      default: false,     null: false
      t.boolean :q1c,                      default: false,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.boolean :q2a,                      default: false,     null: false
      t.boolean :q2b,                      default: false,     null: false
      t.boolean :q2c,                      default: false,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.boolean :q3a,                      default: false,     null: false
      t.boolean :q3b,                      default: false,     null: false
      t.boolean :q3c,                      default: false,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.boolean :q4a,                      default: false,     null: false
      t.boolean :q4b,                      default: false,     null: false
      t.boolean :q4c,                      default: false,     null: false
    end

    create_table :browsers do |t|
      t.integer :user_id
      t.integer :browser_id, default: 0,     null: false
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other

    end

    create_table :social_media_skills do |t|
      t.integer :user_id
      t.integer :social_media_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false 
      t.integer :q10,                     default: 0,     null: false 
      t.integer :q11,                     default: 0,     null: false 
      t.integer :q12,                     default: 0,     null: false 
      t.integer :q13,                     default: 0,     null: false 
      t.integer :q14,                     default: 0,     null: false 
      t.integer :q15,                     default: 0,     null: false 
      t.integer :q16,                     default: 0,     null: false 
      t.integer :q17,                     default: 0,     null: false 
      t.integer :q18,                     default: 0,     null: false 
      t.integer :q19,                     default: 0,     null: false 
      t.integer :q20,                     default: 0,     null: false 
      t.integer :q21,                     default: 0,     null: false 
      t.integer :q22,                     default: 0,     null: false 
      t.integer :q23,                     default: 0,     null: false 
    end

    create_table :social_media_descs do |t|
      t.integer :user_id
      t.integer :social_media_desc_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
    end

    create_table :social_media_platforms do |t|
      t.integer :user_id
      t.integer :social_media_platform_id,                default: 0,     null: false  
      t.boolean :q1a
      t.boolean :q1b
      t.boolean :q1c
      t.boolean :q1d                     
      t.boolean :q2a
      t.boolean :q2b
      t.boolean :q2c
      t.boolean :q2d                      
      t.boolean :q3a
      t.boolean :q3b
      t.boolean :q3c
      t.boolean :q3d                      
      t.boolean :q4a
      t.boolean :q4b
      t.boolean :q4c
      t.boolean :q4d                      
      t.boolean :q5a
      t.boolean :q5b
      t.boolean :q5c
      t.boolean :q5d                      
      t.boolean :q6a
      t.boolean :q6b
      t.boolean :q6c
      t.boolean :q6d                      
      t.boolean :q7a
      t.boolean :q7b
      t.boolean :q7c
      t.boolean :q7d                       
      t.boolean :q8a
      t.boolean :q8b
      t.boolean :q8c
      t.boolean :q8d                       
      t.boolean :magnitude_othera
      t.boolean :magnitude_otherb
      t.boolean :magnitude_otherc
      t.boolean :magnitude_otherd                  
      t.string :other
    end

    create_table :online_colab_skills do |t|
      t.integer :user_id
      t.integer :online_colab_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
    end

    create_table :online_colab_fluentcies do |t|
      t.integer :user_id
      t.integer :online_colab_fluentcy_id,                default: 0,     null: false  
      t.integer :q1,                      default: 0,     null: false
      t.integer :q2,                      default: 0,     null: false
      t.integer :q3,                      default: 0,     null: false
      t.integer :q4,                      default: 0,     null: false
      t.integer :q5,                      default: 0,     null: false
      t.integer :q6,                      default: 0,     null: false
      t.integer :q7,                      default: 0,     null: false 
      t.integer :q8,                      default: 0,     null: false 
      t.integer :q9,                      default: 0,     null: false
      t.integer :q10,                      default: 0,     null: false
      t.integer :q11,                      default: 0,     null: false 
      t.integer :q12,                      default: 0,     null: false 
      t.integer :magnitude_other,         default: 0,     null: false
      t.string :other
    end

    create_table :progresses do |t|
      t.integer :user_id
      t.integer :progress_id, default: 0, null: false
      t.integer :profile_progress, default: 0, null: false
      t.integer :personality_progress, default: 0, null: false
      t.integer :experience_progress, default: 0, null: false
      t.integer :tech_progress, default: 0, null: false
      t.integer :basic_progress, default: 0, null: false
      t.integer :advanced_progress, default: 0, null: false
      t.integer :media_progress, default: 0, null: false
      t.integer :word_progress, default: 0, null: false
      t.integer :presentation_progress, default: 0, null: false
      t.integer :spreadsheet_progress, default: 0, null: false
      t.integer :email_progress, default: 0, null: false
      t.integer :internet_progress, default: 0, null: false
      t.integer :social_progress, default: 0, null: false
      t.integer :online_progress, default: 0, null: false    
    end 

  end
end