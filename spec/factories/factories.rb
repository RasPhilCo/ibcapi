require 'faker'

FactoryGirl.define do 
  factory :video do 
     yt_id { @id = Faker::Lorem.characters(10) }
     title { Faker::Lorem.sentence }
     description { Faker::Lorem.sentence }
     player_url { Faker::Internet.url('interwebs.com', "/embed/#{@id}") }
     view_count { Faker::Number.number(5) }
     favorite_count { Faker::Number.number(3) }
     popularity { Faker::Number.number(2) }
  end 
end