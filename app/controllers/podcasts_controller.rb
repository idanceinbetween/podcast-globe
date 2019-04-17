class PodcastsController < ApplicationController
  def index
    if params[:category]
      @podcasts = Category.find(params[:category]).podcasts.uniq.sort_by { |p| p.subscriptions.size }.reverse
      @categories = Category.order(:name)
      @category = "in #{Category.find(params[:category]).name}"
    else
      @podcasts = Podcast.all.sort_by { |p| p.subscriptions.size }.reverse
      @categories = Category.order(:name)
      @category = nil
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.episodes
    @categories = @podcast.categories
    @subscribers = @podcast.subscribers
    @user = current_user
  end

  def subscription
    @podcast = Podcast.find(params[:id])
    current_user.toggle_subscription(@podcast)
    redirect_to @podcast
  end

  private
  def podcast_params
    params.require(:category).permit(:category)
  end
end
