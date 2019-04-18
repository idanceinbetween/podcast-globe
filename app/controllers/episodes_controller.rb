class EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params[:id])
    @podcast = @episode.podcast
    @favouriters = @episode.favouriters
    @notes = @episode.notes
    @keywords = @episode.keywords
    @user = current_user
    if @podcast.episodes.size > 1
      @siblings = @podcast.episodes.select{|e| e != @episode}
    end
    @note = Note.new
  end

  def favouritisation
    episode = Episode.find(params[:id])
    current_user.toggle_favouritisation(episode)
    redirect_to podcast_path(episode.podcast)
  end

  def play

  end

end
