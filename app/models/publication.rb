# app/models/publication.rb
class Publication < ApplicationRecord
  # belongs_to :publishable, polymorphic: true # This is the old way
  delegated_type :publishable, types: %w[ Post Comment ]

  belongs_to :author

  # Enable nested attributes
  accepts_nested_attributes_for :publishable

  # Delegating a method (e.g., title for Post, content for Comment) to the publishable object
  delegate :title, to: :publishable, allow_nil: true
  delegate :content, to: :publishable, allow_nil: true


  # Method to return a displayable title or name for the publication
  def display_name
    case publishable
    when Post
      publishable.title
    when Comment
      "Comment by #{author.name}"
    else
      'Unknown Publication'
    end
  end

end
