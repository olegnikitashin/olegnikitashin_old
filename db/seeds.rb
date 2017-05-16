Skill.create!(title: 'Ruby on Rails', percent_utilized: 75)
Skill.create!(title: 'Javascript', percent_utilized: 15)
Skill.create!(title: 'HTML/CSS', percent_utilized: 10)
puts 'Skills added!'

10.times do
  Blog.create!(
    title: Faker::Lorem.sentence(3),
    body: Faker::Lorem.paragraph(2)
  )
end
puts 'Bloposts added!'

9.times do
  Portfolio.create!(
      title: Faker::Lorem.sentence(4),
      subtitle: Faker::Lorem.sentence(2),
      body: Faker::Lorem.paragraph(2),
      main_image: 'http://placehold.it/600x400',
      thumb_image: 'http://placehold.it/350x200'
  )
end
puts 'Portfolios added!'