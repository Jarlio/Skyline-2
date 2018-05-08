class CreateParagraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :paragraphs do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
