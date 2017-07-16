10.times do
  Post.create({
              title: Faker::Job.field,
              summary: Faker::Lorem.sentence
                 })
end
