class Link < ApplicationRecord
  has_many :visits, dependent: :destroy

  validates :original_url, format: { with: %r{https?:\/\/[\S]+} }
  validates :short_code, uniqueness: true

  def track_visitor(location)
    visits.create location.slice('ip', 'city', 'country')
  end
end
