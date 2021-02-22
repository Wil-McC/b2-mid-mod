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
  describe 'instance methods' do
    before :each do
      @ab = Mechanic.create!(name: 'Absolam', years_experience: 42)
      @vi = Mechanic.create!(name: 'Vi Allor', years_experience: 22)
      @cr = Mechanic.create!(name: 'Crandor Armalax', years_experience: 445)
      @hool = Ride.create!(name: 'The Hoolidan', thrill_rating: 7, open: true)
      @naga = Ride.create!(name: 'Fearsome Naga', thrill_rating: 8, open: false)
      @fuze = Ride.create!(name: 'Short Fuuze', thrill_rating: 5, open: true)
      @fall = Ride.create!(name: 'DeepFall', thrill_rating: 10, open: true)

      @cr.rides << @fuze
      @cr.rides << @hool
      @cr.rides << @naga
      @cr.rides << @fall
    end
    describe '#rides_sorted' do
      it 'returns by thrill descending' do
        expect(@cr.rides_sorted).to eq([@fall, @naga, @hool, @fuze])
      end
    end
  end
end
