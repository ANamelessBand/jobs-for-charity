module WebsiteHelpers
  def add_task(user, title, description, reward, location)
    task = Task.new user: user,
                     title: title,
                     description: description,
                     reward: reward,
                     location: location
    task.save
  end
end
