require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
  end
end
