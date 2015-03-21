applicaitons = [
  {
    task: Task.first,
    user: User[1],
    share: 0.25,
    charity: Charity.first,
    motivation: "I like mowning lawns ^^"
  },
  {
    task: Task.first,
    user: User[2],
    share: 0.30,
    charity: Charity.first,
    motivation: "I have the right professional qualification for this job!"
  }
]

applicaitons.each do |applicaiton|
  dummy_applicaiton = Application.new applicaiton
  dummy_applicaiton.save if dummy_applicaiton.valid?
end
