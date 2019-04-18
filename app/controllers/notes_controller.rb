class NotesController < ApplicationController

  def create
    byebug
    @note = Note.create(note_params)
    redirect_to episode_path(@note.episode)
  end

  # def edit

  # end

  # def update
    
  # end

  # def destroy
 
  # end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :episode_id)
  end
end
