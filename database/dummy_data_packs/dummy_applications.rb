applicaitons = [
  {
    task: Task.first,
    user: User[2],
    share: 0.25,
    charity: Charity.first,
    motivation: "I have my own shovel."
  },
  {
    task: Task.first,
    user: User[3],
    share: 0.50,
    charity: Charity[3],
    motivation: "I can get a snow blower for half the price."
  },
  {
    task: Task[3],
    user: User[4],
    share: 0.70,
    charity: Charity[4],
    motivation: "I am in great physical fitness!"
  },
  {
    task: Task[3],
    user: User[5],
    share: 0.40,
    charity: Charity[6],
    motivation: "I lift a 100kg! Bro, do you even lift ?"
  },
  {
    task: Task[5],
    user: User[3],
    share: 1.0,
    charity: Charity[3],
    motivation: "I love cooking, it's my hobby!"
  },
  {
    task: Task[6],
    user: User[5],
    share: 0.20,
    charity: Charity[4],
    motivation: "I have two years experience as a babysitter, kids love me!"
  },
  {
    task: Task[7],
    user: User[6],
    share: 0.70,
    charity: Charity[5],
    motivation: "I own a very sexy bathing suit."
  }
]

applicaitons.each do |applicaiton|
  dummy_applicaiton = Application.new applicaiton
  dummy_applicaiton.save if dummy_applicaiton.valid?
end
