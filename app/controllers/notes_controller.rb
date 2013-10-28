class NotesController < ApplicationController

  def create
    if get_controller_from_state == 'hosts'
      @host = Host.find get_id_from_state
      note = @host.notes.build note_params(:new_note)
    else
      note = Note.new note_params(:new_note)
    end

    if note.save
      redirect_to_state notice: (t 'success.create', thing: 'Note')
    else
      redirect_to_state error: (t 'error.create', thing: 'Note')
    end
  end
  
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

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html {
        redirect_to_state notice: (t 'success.delete', thing: 'Note') }
      format.json { head :no_content }
    end
  end

  private

  def note_params(note_option = :note)
    params.require(note_option).permit(:note)
  end

end
