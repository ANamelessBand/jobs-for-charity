charities = [
    {
      name: "Red Cross",
      description: "The Red Cross is a humanitarian organization that provides emergency assistance, disaster relief and education",
      types: [CharityType.find(id: 4)]
    },
    {
      name: "UNICEF",
      description: "The United Nations Children's Fund is a United Nations Program headquartered in New York City that provides long-term humanitarian and developmental assistance to children and mothers in developing countries. It is one of the members of the United Nations Development Group and its Executive Committee.",
      types: [CharityType.find(id: 3)]
    }
  ]

charities.each do |charity|
  dummy_charity = Charity.new title: charity[:name], description: charity[:description]
  return unless dummy_charity.valid?
  dummy_charity.save
  charity[:types].each { |charity_type| dummy_charity.add_charity_type charity_type }
end