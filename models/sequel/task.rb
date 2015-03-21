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
end
