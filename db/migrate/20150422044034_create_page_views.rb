class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.integer 'user_id'
      t.string 'request_url', :limit => 200
      t.string 'ip_address', :limit => 16
      t.string 'created_at'
    end
  end
end
