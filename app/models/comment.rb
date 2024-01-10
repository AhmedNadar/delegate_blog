class Comment < ApplicationRecord
  include Publishable
  belongs_to :post
end
