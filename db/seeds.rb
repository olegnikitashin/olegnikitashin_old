Skill.create!(title: 'Ruby on Rails', percent_utilized: 75)
Skill.create!(title: 'Javascript', percent_utilized: 15)
Skill.create!(title: 'HTML/CSS', percent_utilized: 10)
puts 'Skills added!'

3.times do |topic|
  Topic.create!(
           title: "Topic #{topic}"
  )
end
puts 'Topics added!'

10.times do
  Blog.create!(
    title: Faker::Lorem.sentence(5),
    body: Faker::Lorem.paragraph(10),
    topic_id: Topic.last.id
  )
end
puts 'Bloposts added!'

7.times do
  Portfolio.create!(
      title: Faker::Lorem.sentence(4),
      subtitle: "Ruby On Rails",
      body: Faker::Lorem.paragraph(2),
      main_image: 'http://placehold.it/600x400',
      thumb_image: 'http://placehold.it/350x200'
  )
end

2.times do
  Portfolio.create!(
      title: Faker::Lorem.sentence(4),
      subtitle: "VueJS",
      body: Faker::Lorem.paragraph(2),
      main_image: 'http://placehold.it/600x400',
      thumb_image: 'http://placehold.it/350x200'
  )
end
puts 'Portfolios added!'

portfolio = Portfolio.last
3.times do |technology|
  portfolio.technologies.create!(name: "Technology #{technology}")
end
puts 'Technologies added!'