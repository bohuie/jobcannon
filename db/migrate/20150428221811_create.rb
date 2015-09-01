class Create < ActiveRecord::Migration
  def change
  	create_table "flagged_jobs", force: true do |t|
    t.integer   "user_id"
    t.integer   "posting_id"
    t.string    "status"
  end
  end
end
