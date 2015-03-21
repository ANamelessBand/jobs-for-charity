class Charity < Sequel::Model
  plugin :validation_helpers

  many_to_many :charity_types

  def validate
    validates_presence [:title, :description]
  end
end
