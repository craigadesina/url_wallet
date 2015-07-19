
require "faker"

  20.times do
    user = User.new(email: Faker::Internet.email, name: Faker::Name.name, password: Faker::Internet.password(8))
    user.skip_confirmation!
    user.save!
    5.times do
      topic = user.topics.build(title: Faker::Lorem.sentence)
      topic.save!

      3.times do
        bookmark = topic.bookmarks.build(url: Faker::Internet.url)
        bookmark.save!
      end
    end
  end















# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
