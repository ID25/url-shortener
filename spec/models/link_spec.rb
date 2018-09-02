require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'Validations' do
    it { should have_many(:visits) }
    it { should validate_presence_of(:original_url) }
    it { should validate_presence_of(:short_code) }
    it { should allow_value('https://google.com').for(:original_url) }
    it { should_not allow_value('site_address').for(:original_url) }
  end
end
