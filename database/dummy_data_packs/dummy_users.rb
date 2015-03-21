names = ['TheUser',
'amanda']

names.each do |name|
  dummy_user = User.new username: name,
                        password: "password",
                        email: "#{name}@dfacebook.com"
  dummy_user.save if dummy_user.valid?
  dummy_user.add_charity_type CharityType.all.first
end
