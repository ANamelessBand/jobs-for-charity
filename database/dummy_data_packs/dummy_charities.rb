charities = [
    {
      name: "Eurogroup for Animals",
      description: "Eurogroup for Animals is an organisation based in Brussels, Belgium, which seeks to improve the treatment of animals throughout the European Union, and represents animal welfare organisations in almost all the European member states. Since it was launched in 1980, the organisation has succeeded in encouraging the European Union to adopt higher legal standards of animal protection.",
      types: [CharityType.find(id: 1)]
    },
    {
      name: "United Nations Environment Programme",
      description: "The United Nations Environment Programme (UNEP) is an agency of the United Nations that coordinates its environmental activities, assisting developing countries in implementing environmentally sound policies and practices. It was founded by Maurice Strong, its first director, as a result of the United Nations Conference on the Human Environment in June 1972 and has its headquarters in the Gigiri neighborhood of Nairobi, Kenya. UNEP also has six regional offices and various country offices.",
      types: [CharityType.find(id: 2)]
    },
    {
      name: "UNICEF",
      description: "The United Nations Children's Fund (UNICEF) is a United Nations Program headquartered in New York City that provides long-term humanitarian and developmental assistance to children and mothers in developing countries. It is one of the members of the United Nations Development Group and its Executive Committee.",
      types: [CharityType.find(id: 3)]
    },
    {
      name: "Breast Cancer Research Foundation",
      description: "Working to achieve prevention and a cure for breast cancer",
      types: [CharityType.find(id: 4)]
    },
    {
      name: "National Council on Teacher Quality",
      description: "The National Council on Teacher Quality (NCTQ) is a think tank founded in 2000 and based in Washington, D.C. that advocates for tougher evaluations of classroom teachers. It is primarily known for its Teacher Prep Review, a report released in June 2013 that found American teacher education programs largely inadequate.",
      types: [CharityType.find(id: 5)]
    },
    {
      name: "American Philosophical Association",
      description: "Scholarly activities in philosphy.",
      types: [CharityType.find(id: 6)]
    }
  ]

charities.each do |charity|
  dummy_charity = Charity.new title: charity[:name], description: charity[:description]
  return unless dummy_charity.valid?
  dummy_charity.save
  charity[:types].each { |charity_type| dummy_charity.add_charity_type charity_type }
end