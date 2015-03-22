class Task < Sequel::Model
  plugin :validation_helpers

  one_to_many :applications
  many_to_one :user

  def validate
    super
    validates_presence [:title, :description, :location, :reward]
  end

  class << self
    def by_status(code)
      where(state: code).all
    end

    def opened
      by_status 0
    end

    def in_progress
      by_status 1
    end

    def closed
      by_status 2
    end

    def completed
      by_status 3
    end
  end

  def update_status(code)
    update(state: code)
  end

  def open
    update_status 0
  end

  def start
    update_status 1
  end

  def close
    update_status 2
  end

  def complete
    update_status 3
  end

  def owner
    user
  end

  def status_string
    case state
    when 0
      'new'
    when 1
      'in progress'
    when 2
      'canceled'
    when 3
      'completed'
    end
  end

  def approved_application
    Application.find(task: self, status: 1) || Application.find(task: self, status: 3)
  end

  def asignee
    approved_application ? approved_application.applicant : nil
  end

  def new_applications
      applications.select { |application| application.status.zero? }
  end
end
