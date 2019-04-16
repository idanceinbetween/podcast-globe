class PodcastsController < ApplicationController
  def index
    if params[:category]
      @podcasts = Category.find_by(name: params[:category]).podcasts
      @categories = Category.order(:name)
    else
      @podcasts = Podcast.order(:name)
      @categories = Category.order(:name)
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

end
