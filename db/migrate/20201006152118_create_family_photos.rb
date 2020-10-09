class CreateFamilyPhotos < ActiveRecord::Migration[6.0]

  def change
    create_table :family_photos do |t|
      t.column "member", "person"
      t.text :src
      t.text :alt

      t.timestamps
    end
  end
end
