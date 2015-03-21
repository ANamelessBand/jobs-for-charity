class Task < Sequel::Model
  plugin :validation_helpers

  one_to_many :applications

  def validate
    super
    validates_presence [:title, :description, :location, :award]
    # validates_includes [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5], :rating
  end

  class << self
  end
end
