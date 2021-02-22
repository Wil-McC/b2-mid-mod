require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end
  describe 'class methods' do
    before :each do
      @ab = Mechanic.create!(name: 'Absolam', years_experience: 42)
      @vi = Mechanic.create!(name: 'Vi Allor', years_experience: 22)
      @cr = Mechanic.create!(name: 'Crandor Armalax', years_experience: 445)
    end
    describe 'Mechanic::average_xp' do
      it 'returns the average years experience' do
        expect(Mechanic.average_xp).to eq(169.67)
      end
    end
    describe 'Mechanic::total_xp' do
      it 'returns total xp' do
        expect(Mechanic.total_xp).to eq(509)
      end
    end
  end
end
