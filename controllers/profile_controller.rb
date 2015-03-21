class ProfileController < ApplicationController
  NAMESPACE = '/profile'
  
  get '/:id' do
	@user = User.find(id: params[:id]);
	@title = "zomg"
    erb :profile
  end

end