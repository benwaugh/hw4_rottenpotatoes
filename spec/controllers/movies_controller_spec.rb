require 'spec_helper'

describe MoviesController do
  describe 'adding new movie' do
    it 'should create a new movie' do
      post :create
    end
  end
  describe 'sorting movies' do
    it 'should sort by title' do
      get :index, {:sort => 'title'}
    end
    it 'should sort by release date' do
      get :index, {:sort => 'release_date'}
    end
  end
end

