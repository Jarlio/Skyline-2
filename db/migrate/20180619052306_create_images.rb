class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.string :title, null: true

      t.timestamps
    end
  end
end
