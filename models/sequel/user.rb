class User < Sequel::Model
  plugin :validation_helpers

  many_to_many :charity_types
  one_to_many :tasks

  def validate
    super
    validates_presence [:username, :password, :email]
    validates_unique :username, :email
  end

  class << self
    def top_employers
      all.sort_by { |user| -user.amount_paid.to_f }
    end

    def top_employees
      all.sort_by { |user| -user.applications_donation.to_f }
    end
  end

  def applications_donation
    rewards_donated = 0
    completed_applications.each do |application|
      rewards_donated += application.task.reward * application.share
    end

	  rewards_donated
  end

  def amount_earned
    rewards = 0
    completed_applications().each do |application|
      rewards += application.task.reward * (1 - application.share)
    end
	rewards
  end

  def applications_rating
    applications_completed = completed_applications()

    if applications_completed.size.zero?
      0
    else
      ratingsSum = 0
      applications_completed.each do |application|
        ratingsSum += application.rating
      end

      ratingsSum / applications_completed.size
    end
  end

  def completed_applications
    Application.where(user: self, status: 3).all
  end

  def recently_completed_applications
    appliactions_completed = []
    completed_applications().last(::PROFILE_RECENTLY_COMPLETED_COUNT).each do |application|
	  completed_applications.push(application.task)
	end
	completed_applications
  end

  def completed_tasks
    Task.where(user: self, state:3).all
  end

  def amount_paid
    amount = 0
    completed_tasks().each do |task|
      amount += task.reward
    end

    amount
  end

  def recently_completed_tasks
    completed_tasks().last(::PROFILE_RECENTLY_COMPLETED_COUNT)
  end

  def applications
    Application.where(user: self).all
  end

  def interested_in_charities
    CharityType.all.map(&:charities).flatten.uniq
  end
end
