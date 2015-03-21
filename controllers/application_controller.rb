class ApplicationController < Sinatra::Base
  attr_reader :navigation_links

  helpers ApplicationHelpers
  helpers UserHelpers

	before do
    @navigation_links = [
                          NavigationLink.new(NavigationLink.dashboard_id, '/', 'Dashboard'),
                        ]
  end
end
