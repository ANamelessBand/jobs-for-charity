tasks = [
  {
    user: User[2],
    title: "Shovel the snow",
    description: "I need someone to shovel the snow from my front yard. It shouldn't take more than an hour or two.",
    reward: 10.00,
    location: "London, UK"
  },
  {
    user: User[1],
    title: "Mow the lawn",
    description: "I need someone to mow the lawn. It's a half day work.",
    reward: 40.00,
    location: "South Hampton, UK"
  },
  {
    user: User[3],
    title: "Move furniture",
    description: "I'm moveing to my new apartment and I need help moving the furniture. The new apartment is nearly fully furnished. I need to move just a table and a few sofas.",
    reward: 20.00,
    location: "London, UK"
  },
  {
    user: User[5],
    title: "Move a fridge",
    description: "I need help moving a fridge from the parter to the eigth floor. There are no elevators in the building. Thank you!",
    reward: 4.99,
    location: "Manchetser, UK"
  },
  {
    user: User[6],
    title: "Cook dinner",
    description: "My boyfriend is coming to my place tomorrow. I want to make a great dinner, but unfortunatelly I'm a disaster in the kitchen. Can someone help me?",
    reward: 30.00,
    location: "London, UK"
  },
  {
    user: User[4],
    title: "Babysit the children",
    description: "My wife and I have an anniversary this Friday and we want to dinner otside. Unfortunately our parents are not in town and we need someone to look after the children during the night.",
    reward: 20.00,
    location: "South Hampton, UK"
  },
  {
    user: User[3],
    title: "Wash the car",
    description: "My car has become really dirty. I'm looking for someone to clean it for me.",
    reward: 4.99,
    location: "London, UK"
  },
  {
    user: User[2],
    title: "Walk the dog",
    description: "I'm leaving for a few days and I need someone to feed and walk the dog. Anyone up for the challenge? :P",
    reward: 35.00,
    location: "Manchester, UK"
  },
  {
    user: User[1],
    title: "Clean the house",
    description: "I'm looking for someone to clean the house for me. It's about 95 square meters. Looking forward!",
    reward: 4.99,
    location: "London, UK"
  },
  {
    user: User[5],
    title: "Meet my parents",
    description: "I'm looking for a good-looking woman to play my 'girlfriend Wilma' during a dinner with my parents.",
    reward: 100.00,
    location: "London, UK"
  }
]

tasks.each do |task|
  dummy_task = Task.new task
  dummy_task.save if dummy_task.valid?
end
