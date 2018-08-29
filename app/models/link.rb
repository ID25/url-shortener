class Link < ApplicationRecord
  validates :original_url, format: { with: %r{https?:\/\/[\S]+} }
end
