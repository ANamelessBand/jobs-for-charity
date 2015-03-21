class CharityType < Sequel::Model
	many_to_many :users
	many_to_many :charities
end
