class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
    @categories = Category.all
  end

  def show
  end
end
