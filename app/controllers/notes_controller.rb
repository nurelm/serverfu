class NotesController < ApplicationController

  def update
     @note = Note.find params[:id]
   
     respond_to do |format|
       if @note.update_attributes(note_params)
         format.html { redirect_to(@note, :notice => 'Note was successfully updated.') }
         format.json { respond_with_bip(@note) }
       else
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@note) }
       end
     end
   end


  private

  def note_params
    params.require(:note).permit(:note)
  end

end
