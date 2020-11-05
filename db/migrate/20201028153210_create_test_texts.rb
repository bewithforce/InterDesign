class CreateTestTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :test_texts do |t|
      t.text :anything
      t.timestamps
    end
  end
end
