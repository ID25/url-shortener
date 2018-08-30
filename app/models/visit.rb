class Visit < ApplicationRecord
  alias_attribute :visited_at, :created_at

  belongs_to :link

  scope :latest, ->(num) { includes(:link).order(visited_at: :desc).limit(num) }
end
