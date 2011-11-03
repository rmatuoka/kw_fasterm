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

ActiveRecord::Schema.define(:version => 20100525032143) do

  create_table "case_images", :force => true do |t|
    t.integer  "case_id"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.string   "legend"
  end

  create_table "cases", :force => true do |t|
    t.string   "title"
    t.string   "sumary"
    t.text     "body"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "category"
  end

  create_table "categories", :force => true do |t|
    t.integer  "section_id"
    t.string   "title"
    t.integer  "published",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dynamic_pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "published",          :default => 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "legend"
  end

  create_table "event_galleries", :force => true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "event_gallery_images", :force => true do |t|
    t.integer  "event_gallery_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "published",          :default => 0
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "headers", :force => true do |t|
    t.string   "title"
    t.integer  "dynamic_page_id"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "highlights", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "position"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "published",          :default => 0
  end

  create_table "newsletters", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notice_images", :force => true do |t|
    t.string   "title"
    t.string   "legend"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "notice_id"
  end

  create_table "notices", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "summary"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "partners", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "published"
  end

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.string   "title"
    t.string   "legend"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.integer  "published",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "request_catalogs", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "number"
    t.string   "postalcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aplicacao"
    t.string   "tipo_existente"
  end

  create_table "schedule_visits", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "adress"
    t.string   "number"
    t.string   "postalcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.integer  "published",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitecontacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "published"
    t.text     "testimonial"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
