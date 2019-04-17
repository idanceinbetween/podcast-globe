class KeywordsController < ApplicationController
  def show
    @keyword = Keyword.find(params[:id])
    @episodes = @keyword.episodes
  end
end
