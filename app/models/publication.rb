# app/models/publication.rb
class Publication < ApplicationRecord
  # belongs_to :publishable, polymorphic: true # This is the old way
  delegated_type :publishable, types: %w[ Post Comment ]

  belongs_to :author
end
