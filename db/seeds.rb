# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do |c|
    Directorship.create({:name => Faker::Movies::LordOfTheRings.location, :director => 1})
end

5.times do |manager_id|
    5.times do |dir_id|
        Cell.create({:name => Faker::Movies::HarryPotter.location, :manager => 1, :directorship_id => dir_id})
    end
end

User.create({:email => 'admin@email.com', :name => 'gerenciador', :password => '1234567', :cell_id => 1, :directorship_id => 1, :kind => 'gp_director'})

5.times do |c|
    #User.create([{email: Faker::Internet.email}, {name: Faker::Games::LeagueOfLegends.champion}, {encrypted_password: '1234567'}, {cell_id: c + c}, {directorship_id: c}, {kind: 'director'}])
end

5.times do |c|
    #User.create([{email: Faker::Internet.email}, {name: Faker::Games::LeagueOfLegends.champion}, {encrypted_password: '1234567'}, {cell_id: c + c + c}, {directorship_id: c}, {kind: 'project_director'}])
end