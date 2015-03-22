class User < Sequel::Model
  plugin :validation_helpers

  many_to_many :charity_types
  one_to_many :tasks

  def validate
    super
    validates_presence [:username, :password, :email]
    validates_unique :username, :email
  end

  
  def amount_donated_by_working
    rewardsDonated = 0
    Application.where(user: self, status: 3).all.each do |application|
      rewardsDonated += (application.task.reward)*(application.share)
    end
	rewardsDonated
  end
  
  def amount_earned
    rewards = 0
    Application.where(user: self, status: 3).all.each do |application|
      rewards += application.task.reward
    end
	rewards
  end
  
  def avg_rating_as_worker
    completedApplications = Application.where(user: self, status: 3).all
    if completedApplications.size == 0
      return "Not available"
    else
	  ratingsSum = 0
	  completedApplications.each do |application|
        ratingsSum += application.rating
      end
      return ratingsSum/completedApplications.size
    end
  end
  
  def completed_tasks_as_worker_count
    Application.where(user: self, status: 3).all.size
  end
  
  def recently_completed_as_worker
    tasksCompleted = []
    Application.where(user: self, status: 3).all.last(PROFILE_RECENTLY_COMPLETED_COUNT).each do |application|
	  tasksCompleted.push(application.task)
	end
	tasksCompleted
  end
  
  def amout_paid
    amount = 0
    Task.where(user: self, status:3).all.each do |task|
	  amount += task.reward
	end
	return amount
  end
  
  def recently_completed_as_employer
    Task.where(user: self, status:3).all.last(PROFILE_RECENTLY_COMPLETED_COUNT)
  end
  
end
