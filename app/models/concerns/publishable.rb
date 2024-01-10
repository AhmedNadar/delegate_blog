# app/models/concerns/publishable.rb
module Publishable
  extend ActiveSupport::Concern
  included do
    has_one :publication, as: :publishable, touch: true
    # Other shared logic...
  end
end
