class Application < Sequel::Model
  plugin :validation_helpers

  many_to_one :task
  many_to_one :user
  many_to_one :charity

  def validate
    super
    validates_presence [:share, :motivation]
    # validates_includes [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5], :rating
  end

  class << self
    def donations
      where(status: 3).all.inject(0) do |sum, application|
        sum + application.task.reward * application.share
      end
    end
  end

  def applicant
    user
  end

  def status_string
    case status
    when 0
      'open'
    when 1
      'accepted'
    when 2
      'rejected'
    when 3
      'completed'
    end
  end
end
