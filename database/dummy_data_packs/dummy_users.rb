names = ['Kristian',
'Svetlana',
'Yordan',
'Georgy',
'Nikola',
'Filareta']

names.each do |name|
  dummy_user = User.new username: name,
                        password: "password",
                        email: "#{name}@dfacebook.com"
  dummy_user.save if dummy_user.valid?
  dummy_user.add_charity_type CharityType.all[rand(1..CharityType.all.size)]
end
