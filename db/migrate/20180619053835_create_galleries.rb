class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.string :title, null: true
      t.text :description, null: true

      t.timestamps
    end
  end
end
