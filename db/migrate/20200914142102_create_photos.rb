class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.text :members
      t.text :description
      t.string :image, default: 'https://scontent-waw1-1.cdninstagram.com/v/t51.2885-15/e35/s1080x1080/67691459_2520155968259457_4979964391328554901_n.jpg?_nc_ht=scontent-waw1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=i9_KxAImpiYAX_QJAm2&oh=a620f1dfe43e0a47586edfaba2f81a4b&oe=5F88791F'

      t.timestamps
    end
  end
end
