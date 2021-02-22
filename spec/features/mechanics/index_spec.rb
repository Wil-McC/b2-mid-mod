require 'rails_helper'

RSpec.describe 'the mechanic index page' do
  before :each do
    @ab = Mechanic.create!(name: 'Absolam', years_experience: 42)
    @vi = Mechanic.create!(name: 'Vi Allor', years_experience: 22)
    @cr = Mechanic.create!(name: 'Crandor Armalax', years_experience: 445)
  end
  it 'should display all mechanics' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')

    within("#mechanic-#{@ab.id}") do
      expect(page).to have_content(@ab.name)
      expect(page).to have_content(@ab.years_experience)
    end
  end
  it 'displays average years experience' do
    visit '/mechanics'

    within'.dashboard' do
      expect(page).to have_content('169.67')
    end
  end
end
