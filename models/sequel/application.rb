class Application < Sequel::Model
  plugin :validation_helpers

  many_to_one :task
  many_to_one :user
  many_to_one :charity

  def validate
    super
    validates_presence [:share, :status, :motivation]
    validates_includes [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5], :rating
  end

  class << self
  end
end
