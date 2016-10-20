require 'pry'
class LandmarksController < ApplicationController

    #new form to create landmark
    get '/landmarks/new' do
        erb :'landmarks/new'
    end

    #creates new landmark
    post '/landmarks' do
        @landmark = Landmark.create(params[:landmark])
        @landmark.save
        redirect '/landmarks'
    end

    #displays all landmarks
    get '/landmarks' do
        @landmarks = Landmark.all
        erb :'landmarks/index'
    end

    #show page for one landmark
    get '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        erb :'landmarks/show'
    end

    #edit form
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
        erb :'landmarks/edit'
    end

    #updates one landmark
    patch '/landmarks/:id' do
        # binding.pry
        landmark = Landmark.find(params[:id])
        landmark.update(params[:landmark])
        redirect "/landmarks/#{@landmark.id}"
    end

end
