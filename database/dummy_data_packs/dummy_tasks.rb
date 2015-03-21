tasks = [
  {
    task: User.first,
    title: "Mow my lawn",
    description: "I need someone to clean my lawn for me.",
    award: 20.00,
    location: "London, UK"
  }

tasks.each do |task|
  dummy_task = Task.new task
  dummy_task.save if dummy_task.valid?
end
