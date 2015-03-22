class Task < Sequel::Model
  plugin :validation_helpers

  one_to_many :applications
  many_to_one :user

  def validate
    super
    validates_presence [:title, :description, :location, :reward]
  end

  class << self
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

  def asignee
    approved_application = Application.find(id: self.id, status: 1)
    approved_application ? approved_application.applicant : approved_application
  end
end
