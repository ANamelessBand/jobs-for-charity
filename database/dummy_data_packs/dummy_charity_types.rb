charity_types = [
        { 
            name: "Animal Charities",
            description: "Who doesn't love animals? Well, these groups may all love animals but they don't all love each other. This particular type of charity can be broken down further into four distinct groups.\n\
Wildlife conservation organizations\n\
Pet and Animal Welfare Organizations\n\
Hunting & Fishing Conservation Groups\n\
Zoos and Aquariums\n"
        },
        {
            name: "Environmental Charities",
            description: "Environmental Charities focus on ways to promote preservation, appreciation, and sustainable development for the environment. The two primary subgroups for this type of charity are:\n\
Environmental Conservation & Protection\n\
Parks and Nature Centers"
        },
        {
            name: "International NGOs",
            description: "International NGOs (Non-governmental organizations) are typically charities that are headquartered in one country but work in other countries.  In some cases they overlap with other types of charities.\n\
  International Development NGOs\n\
  Disaster Relief & Humanitarian NGOs\n\
  Peace & Human Rights NGOs\n\
  Conservation NGOs\n\
  Child Sponsorship Organizations"
        },
        {
            name: "Health Charities",
            description: "Health charities cover everything from supporting and treating the sick and disabled, working on cures for deseases, and promoting public awareness of specific health risks.\n\
  Disease & Disorder Charities\n\
  Medical Services & Treatment\n\
  Medical Research Charities\n\
  Patient and Family Support Charities"
        },
        {
            name: "Education Charities",
            description: "Education charities serve students from every age group, pre-school to graduate school and beyond.  Some serve as the educational institutions while focus on making education more accessible and effective.\n\
  Private Elementary, Jr. High, and High Schools\n\
  Universities and Colleges\n\
  Scholarship and financial aid services\n\
  School Reform and Experimental Education\n\
  Support for students, teachers, and parents"
        },
        {
            name: "Arts & Culture Charties",
            description: "These types of charities help preserve artistic and cultural heritage as well as celebrate the arts and our history.\n\
  Museums & Art Galleries\n\
  Performing Arts\n\
  Libraries & Historical Societies\n\
  Public Broadcasting and Media"
        }
       ]

charity_types.each do |charity_type|
  dummy_charity_type = CharityType.new charity_type
  dummy_charity_type.save if dummy_charity_type.valid?
end
