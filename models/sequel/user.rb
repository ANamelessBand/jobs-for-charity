class User < Sequel::Model
  plugin :validation_helpers

  many_to_many :charity_types
  one_to_many :tasks

  def validate
    super
    validates_presence [:username, :password, :email]
    validates_unique :username, :email
  end

  def recently_completed
  end
end
