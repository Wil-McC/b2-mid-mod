# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
