require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'Validations' do
    it { should belong_to(:link) }
  end
end
