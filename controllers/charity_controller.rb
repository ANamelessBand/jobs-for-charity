class CharityController < ApplicationController
  NAMESPACE = '/charity/'

  get '/add' do
    @title = 'Add a charity'
    erb :'add_charity.html'
  end

  post '/add-charity' do
    title = params[:charity_title]
    description = params[:charity_description]
    reward = params[:charity_reward]
    location = params[:charity_location]
    charity_types = params.keys.select { |key| key.start_with? 'charity_type' }
                           .map { |key| key.sub("charity_type_", "").to_i }


    charity = Charity.new title: title,
      description: description
    charity.save

    charity_types.each do |charity_type|
        charity.add_charity_type CharityType.find(id: charity_type)
    end

    redirect "/charity/#{charity.id}"
  end
end
