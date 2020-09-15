# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_14_142102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.text "members"
    t.text "description"
    t.string "image", default: "https://scontent-waw1-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/67691459_2520155968259457_4979964391328554901_n.jpg?_nc_ht=scontent-waw1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=i9_KxAImpiYAX_QJAm2&oh=a620f1dfe43e0a47586edfaba2f81a4b&oe=5F88791F"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
