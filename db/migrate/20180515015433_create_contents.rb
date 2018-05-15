# the creation of content
# each article has many contents
# paragraph: a paragraph from the article, can have a title or not
# chart: a chart in the article that is stored as a json
# photo gallery: references a photo gallery to be display
# (added in different migration)

# a convenient method for user to edit their articles
#   (if something need to be change, user will need to change
#   just that something, not the entire article)
# not the most optimal method but since there aren't many types
# of content, it simplifies very much iteration at a small cost

# type 1 means that content is a paragraph, will display it as a paragraph
# 2 : is chart
# 3 : is photo gallery
class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :paragraph
      t.json :chart
      t.integer :type, null: false

      t.timestamps
    end
  end
end
