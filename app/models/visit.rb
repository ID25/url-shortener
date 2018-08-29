class Visit < ApplicationRecord
  alias_attribute :visited_at, :created_at

  belongs_to :link
end
