class AddUserToRatings < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :user, foreign_key: true, null: false
  end
end
