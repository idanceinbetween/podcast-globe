class EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params[:id])
    @podcast = @episode.podcast
    @favouriters = @episode.favouriters
    @notes = @episode.notes
    @keywords = @episode.keywords
    if @podcast.episodes.size > 1
      @siblings = @podcast.episodes.select{|e| e != @episode}
    end
  end
end
