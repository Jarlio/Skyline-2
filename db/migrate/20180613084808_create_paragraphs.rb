class CreateParagraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :paragraphs do |t|
      t.string :title
      t.text :text, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
