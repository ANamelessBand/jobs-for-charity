class ProfileController < ApplicationController
  NAMESPACE = '/profile'
  
  get '/:id' do
	@title = "User information"
	@user = User.find(id: params[:id]);
	
	@rewardsDonated = 0
	ratingsSum = 0;
	
	completedApplications = Application.where(user: @user, status: 3).all
	completedApplications.each do |application|
	  @rewardsDonated += (application.task.reward)*(application.share)
	  ratingsSum += application.rating
	end
	
	@completedTasksCount = completedApplications.size
	if @completedTasksCount == 0
	  @avgRating = "Not available"
	else
	  @avgRating = ratingsSum/@completedTasksCount
	end
	
	@recentlyCompleted = []
	completedApplications.last(PROFILE_RECENTLY_COMPLETED_COUNT).each do |recentTask|
	  recentlyCompleted.push(recentTask.title)
	end
	
    erb :profile
  end

end