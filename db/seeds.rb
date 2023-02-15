User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

user = User.first             
40.times do
    title = Faker::Lorem.sentence(word_count: 1)
    date = Faker::Date.between(from: '2021-04-01', to: '2024-03-31')
    memo = Faker::Lorem.sentence(word_count: 3)
    user.tasks.create!(title: title, is_done: true, due_date: date, priority: 3, memo: memo)
end

Tag.find_or_create_by([
    { name: "大学"},
    { name: "IT"},
    { name: "教養"},
    { name: "語学"},
    { name: "その他"}
])
