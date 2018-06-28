class Tag < ApplicationRecord
  validates :name, presence: :true

  has_and_belongs_to_many :articles,
                          class_name: "Article",
                          foreign_key: "Tag_id",
                          join_table: "Articles_Tags",
                          association_foreign_key: "Article_id"
end
