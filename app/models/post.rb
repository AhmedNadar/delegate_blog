class Post < ApplicationRecord
  include Publishable
  has_many :comments, dependent: :destroy
end
