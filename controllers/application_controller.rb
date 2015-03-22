class ApplicationController < Sinatra::Base
  attr_reader :navigation_links

  helpers ApplicationHelpers
  helpers UserHelpers

	before do
    @navigation_links = [
                          NavigationLink.new(NavigationLink.dashboard_id, '/dashboard', 'Dashboard'),
                          NavigationLink.new(NavigationLink.top_users, '/user/top', 'Top Users')
                        ]
  end
end
