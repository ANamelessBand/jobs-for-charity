class User < Sequel::Model
  plugin :validation_helpers

  many_to_many :charity_types

  def validate
    super
    validates_presence [:username, :password, :email]
    validates_unique :username, :email
  end
end
