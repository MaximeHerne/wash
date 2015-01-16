Formula.destroy_all
Formula.create(name: 'Economique - 6,90€', price: 6.90)
Formula.create(name: 'All-inclusive - 9,90€', price: 9.90)

2.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  })

  user.profile = Profile.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.street_name,
    locality: Faker::Address.city,
    postal_code: Faker::Address.zip_code,
    })

  user.save
end