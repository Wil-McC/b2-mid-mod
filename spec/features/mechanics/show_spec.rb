require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  before :each do
    @ab = Mechanic.create!(name: 'Absolam', years_experience: 42)
    @vi = Mechanic.create!(name: 'Vi Allor', years_experience: 22)
    @cr = Mechanic.create!(name: 'Crandor Armalax', years_experience: 445)

    @hool = Ride.create!(name: 'The Hoolidan', thrill_rating: 7, open: true)
    @naga = Ride.create!(name: 'Fearsome Naga', thrill_rating: 8, open: false)
    @fuze = Ride.create!(name: 'Short Fuuze', thrill_rating: 5, open: true)

    @ab.rides << @hool

    @vi.rides << @naga
    @vi.rides << @fuze

    @cr.rides << @hool
    @cr.rides << @naga
    @cr.rides << @fuze
  end
  it 'shows name experience and open rides' do
    visit "/mechanics/#{@cr.id}"

    expect(page).to have_content("Crandor Armalax's Information Page")
    expect(page).to have_content(@cr.name)
    expect(page).to have_content(@cr.years_experience)

    within(".rides") do
      expect(page).to have_content(@hool.name)
      expect(page).to have_content(@fuze.name)
      expect(page).to_not have_content(@naga.name)
    end
  end
end
