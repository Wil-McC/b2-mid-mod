require 'rails_helper'

RSpec.describe 'the mechanic show page' do
  before :each do
    @ab = Mechanic.create!(name: 'Absolam', years_experience: 42)
    @vi = Mechanic.create!(name: 'Vi Allor', years_experience: 22)
    @cr = Mechanic.create!(name: 'Crandor Armalax', years_experience: 445)

    @hool = Ride.create!(name: 'The Hoolidan', thrill_rating: 7, open: true)
    @naga = Ride.create!(name: 'Fearsome Naga', thrill_rating: 8, open: false)
    @fuze = Ride.create!(name: 'Short Fuuze', thrill_rating: 5, open: true)
    @fall = Ride.create!(name: 'DeepFall', thrill_rating: 10, open: true)

    @ab.rides << @hool

    @vi.rides << @naga
    @vi.rides << @fuze

    @cr.rides << @fuze
    @cr.rides << @hool
    @cr.rides << @naga
    @cr.rides << @fall
  end
  it 'shows name experience and open rides in desc thrill order' do
    visit "/mechanics/#{@cr.id}"

    expect(page).to have_content("Crandor Armalax's Information Page")
    expect(page).to have_content(@cr.name)
    expect(page).to have_content(@cr.years_experience)

    within(".rides") do
      expect(page).to have_content(@hool.name)
      expect(page).to have_content(@fuze.name)
      expect(page).to_not have_content(@naga.name)
      expect(@fall.name).to appear_before(@hool.name)
      expect(@hool.name).to appear_before(@fuze.name)
    end
  end
  it 'has a form element to add rides' do
    visit "/mechanics/#{@cr.id}"

    within('.addform') do
      expect(page).to have_content('Add Ride to Service List')
    end
  end
end
