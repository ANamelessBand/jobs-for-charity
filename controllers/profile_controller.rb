class ProfileController < ApplicationController
  NAMESPACE = '/profile'
  
  get '/:id' do
	@title = "zomg"
	@user = User.find(id: params[:id]);
	
	@rewards = 0
	ratingsSum = 0;
	
	completedApplications = Application.where(user: @user, status: 3).all
	completedApplications.each do |application|
	  @rewards += (application.task.reward)*(application.share)
	  ratingsSum += application.rating
	end
	
	@completedTasksCount = completedApplications.size
	if @completedTasksCount == 0
	  @avgRating = "Not available"
	else
	  @avgRating = ratingsSum/@completedTasksCount
	end
	
    erb :profile
  end

end