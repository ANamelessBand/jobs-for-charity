class ApplicationController < Sinatra::Base
  attr_reader :navigation_links

  helpers ApplicationHelpers
  helpers UserHelpers
  helpers WebsiteHelpers

	before do
    @navigation_links = [
                          NavigationLink.new(NavigationLink.dashboard_id, '/', 'Dashboard'),
                        ]
  end
end
