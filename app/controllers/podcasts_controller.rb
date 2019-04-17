class PodcastsController < ApplicationController
  def index
    if params[:category]
      @podcasts = Category.find(params[:category]).podcasts
      @categories = Category.order(:name)
    else
      @podcasts = Podcast.order(:name)
      @categories = Category.order(:name)
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes
    @categories = @podcast.categories
    @subscribers = @podcast.subscribers
  end

  private
  def podcast_params
    params.require(:category).permit(:category)
  end
end
