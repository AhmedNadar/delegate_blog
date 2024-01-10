class Author < ApplicationRecord
  has_many :publications, foreign_key: :author_id
end
