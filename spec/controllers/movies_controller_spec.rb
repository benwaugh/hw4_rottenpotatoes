require 'spec_helper'

describe MoviesController do
  describe 'finding similar movies' do
    it 'should create a new movie' do
      Movie.should_receive(:create)
      post :create
    end
  end
end

